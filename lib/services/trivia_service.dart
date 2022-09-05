import 'dart:convert';
import 'dart:math' show Random;
import 'package:number_trivia/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/models/trivia_model.dart';
import 'package:number_trivia/services/trivia_provider.dart';
import 'package:number_trivia/constants.dart';

class TriviaService implements TriviaProvider {
  @override
  Future<Trivia?> getNumberTrivia({required int number}) async =>
      await getTrivia(number);

  @override
  Future<Trivia?> getRandomTrivia() async {
    Trivia? fetchedTrivia;
    do {
      fetchedTrivia = await getTrivia(getRandomNumber());
    } while (!fetchedTrivia!.found);
    return fetchedTrivia;
  }

  int getRandomNumber() {
    final random = Random();
    return random.nextInt(1000);
  }

  Future<Trivia?> getTrivia(int number) async {
    try {
      final uri =
          '${ApiConstants.baseUrl}/$number${ApiConstants.triviaEndpoint}';
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> trivia = jsonDecode(response.body);
        final fetchedTrivia = Trivia.fromJson(trivia);
        return fetchedTrivia;
      }
      throw ApiErrorException();
    } catch (_) {
      throw ApiErrorException();
    }
  }
}
