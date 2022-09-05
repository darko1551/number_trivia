import '../models/trivia_model.dart';

abstract class TriviaProvider {
  Future<Trivia?> getNumberTrivia({required int number});
  Future<Trivia?> getRandomTrivia();
}
