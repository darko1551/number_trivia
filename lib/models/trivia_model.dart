import 'package:flutter/foundation.dart';

@immutable
class Trivia {
  final String text;
  final int number;
  final bool found;

  const Trivia({
    required this.text,
    required this.number,
    required this.found,
  });

  factory Trivia.fromJson(Map<String, dynamic> json) {
    return Trivia(
      text: json['text'],
      number: int.parse(
        json['number'].toString(),
      ),
      found: json['found'] == true ? true : false,
    );
  }
}
