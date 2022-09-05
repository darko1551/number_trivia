import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../models/trivia_model.dart';

@immutable
class TriviaState extends Equatable {
  final bool isLoading;
  final Exception? exception;
  final Trivia? trivia;

  const TriviaState.empty()
      : isLoading = false,
        exception = null,
        trivia = null;

  const TriviaState({
    required this.isLoading,
    required this.exception,
    required this.trivia,
  });

  @override
  List<Object?> get props => [
        isLoading,
        exception,
        trivia,
      ];
}
