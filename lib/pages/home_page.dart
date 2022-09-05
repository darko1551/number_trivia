import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/assets/strings.dart';
import 'package:number_trivia/bloc/trivia_event.dart';
import 'package:number_trivia/exceptions/exceptions.dart';
import 'package:number_trivia/widgets/button_widget.dart';
import 'package:number_trivia/widgets/text_field_widget.dart';
import 'package:number_trivia/bloc/trivia_bloc.dart';
import 'package:number_trivia/bloc/trivia_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _inputNumberController;

  @override
  void initState() {
    _inputNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _inputNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriviaBloc, TriviaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 253, 244, 231),
          appBar: AppBar(
            shadowColor: const Color.fromARGB(0, 0, 0, 0),
            backgroundColor: const Color.fromARGB(255, 253, 244, 231),
            centerTitle: true,
            title: const Text(
              titleString,
              style: TextStyle(
                color: Color.fromARGB(255, 50, 94, 87),
                fontSize: 25,
              ),
            ),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 90),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                captionString,
                style: TextStyle(
                  color: Color.fromARGB(255, 50, 94, 87),
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                showErrorMessage(state),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 50, 94, 87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    TextFieldWidget(
                      textEditingController: _inputNumberController,
                      hint: hintString,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      text: searchButtonString,
                      onTapped: () {
                        final number =
                            int.tryParse(_inputNumberController.text);
                        context
                            .read<TriviaBloc>()
                            .add(NumberTriviaEvent(number: number));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      text: randomButtonString,
                      onTapped: () {
                        context
                            .read<TriviaBloc>()
                            .add(const RandomNumberTriviaEvent());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String showErrorMessage(TriviaState state) {
  if (state.exception is WrongInputFormatException) {
    return wrongInputFormatExceptionString;
  } else if (state.exception is ApiErrorException) {
    return serverErrorExceptionString;
  } else {
    return '';
  }
}
