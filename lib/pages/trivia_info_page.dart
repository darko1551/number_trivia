import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/bloc/trivia_event.dart';
import 'package:number_trivia/widgets/button_widget.dart';
import 'package:number_trivia/bloc/trivia_state.dart';
import 'package:number_trivia/bloc/trivia_bloc.dart';
import '../assets/strings.dart';
import '../bloc/trivia_state.dart';

class TriviaInfoPage extends StatefulWidget {
  const TriviaInfoPage({Key? key}) : super(key: key);

  @override
  State<TriviaInfoPage> createState() => _TriviaInfoPageState();
}

class _TriviaInfoPageState extends State<TriviaInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriviaBloc, TriviaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: const Color.fromARGB(0, 0, 0, 0),
            backgroundColor: const Color.fromARGB(255, 50, 94, 87),
            centerTitle: true,
            title: const Text(
              titleString,
              style: TextStyle(
                color: Color.fromARGB(255, 253, 244, 231),
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 50, 94, 87),
          body: Padding(
            padding: const EdgeInsets.only(
              //top: 90,
              bottom: 30,
              left: 30,
              right: 30,
            ),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 253, 244, 231),
                        ),
                        child: Center(
                          child: Text(
                            state.trivia!.number.toString(),
                            style: const TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 43, 62, 59),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        state.trivia!.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 253, 244, 231),
                          height: 1.3,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 25,
                        ),
                      ),
                      ButtonWidget(
                        text: backButtonString,
                        onTapped: () {
                          context.read<TriviaBloc>().add(
                                const ReturnEvent(),
                              );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
