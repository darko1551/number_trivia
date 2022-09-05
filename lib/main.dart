import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/bloc/trivia_bloc.dart';
import 'package:number_trivia/exceptions/exceptions.dart';
import 'package:number_trivia/pages/home_page.dart';
import 'package:number_trivia/pages/trivia_info_page.dart';

import 'bloc/trivia_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TriviaBloc>(
        create: (context) => TriviaBloc(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriviaBloc, TriviaState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state == const TriviaState.empty()) {
          return const HomePage();
        } else if (state.trivia != null && state.exception == null) {
          return const TriviaInfoPage();
        } else if (state.exception is WrongInputFormatException) {
          return const HomePage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
