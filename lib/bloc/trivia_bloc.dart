import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:number_trivia/bloc/trivia_event.dart';
import 'package:number_trivia/bloc/trivia_state.dart';
import 'package:number_trivia/services/trivia_service.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  TriviaBloc() : super(const TriviaState.empty()) {
    final provider = TriviaService();
    on<NumberTriviaEvent>((event, emit) async {
      emit(
        const TriviaState(
          isLoading: true,
          exception: null,
          trivia: null,
        ),
      );
      final number = event.number;
      try {
        final trivia = await provider.getNumberTrivia(number: number);
        emit(
          TriviaState(
            isLoading: false,
            exception: null,
            trivia: trivia,
          ),
        );
      } on Exception catch (e) {
        emit(
          TriviaState(
            isLoading: false,
            exception: e,
            trivia: null,
          ),
        );
      }
    });

    on<RandomNumberTriviaEvent>((event, emit) async {
      emit(
        const TriviaState(
          isLoading: true,
          exception: null,
          trivia: null,
        ),
      );
      try {
        final trivia = await provider.getRandomTrivia();
        emit(
          TriviaState(
            isLoading: false,
            exception: null,
            trivia: trivia,
          ),
        );
      } on Exception catch (e) {
        emit(
          TriviaState(
            isLoading: false,
            exception: e,
            trivia: null,
          ),
        );
      }
    });

    on<ReturnEvent>((event, emit) async {
      emit(
        const TriviaState.empty(),
      );
    });
  }
}
