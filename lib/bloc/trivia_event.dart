import 'package:flutter/foundation.dart';

@immutable
class TriviaEvent {
  const TriviaEvent();
}

@immutable
class NumberTriviaEvent implements TriviaEvent {
  final int number;

  const NumberTriviaEvent({
    required this.number,
  });
}

@immutable
class RandomNumberTriviaEvent implements TriviaEvent{
  const RandomNumberTriviaEvent();
}

@immutable
class ReturnEvent implements TriviaEvent{
  const ReturnEvent();
}
