import 'package:flutter/material.dart';
import 'package:number_trivia/widgets/button_widget.dart';

import '../assets/strings.dart';

class TriviaInfoPage extends StatefulWidget {
  const TriviaInfoPage({Key? key}) : super(key: key);

  @override
  State<TriviaInfoPage> createState() => _TriviaInfoPageState();
}

class _TriviaInfoPageState extends State<TriviaInfoPage> {
  @override
  Widget build(BuildContext context) {
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
                    child: const Center(
                      child: Text(
                        '25',
                        style: TextStyle(
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
                  const Text(
                    'Is the number of years of marriage marked in a silver wedding anniversary. Is the number of years of marriage marked in a silver wedding anniversary. Is the number of years of marriage marked in a silver wedding anniversary. Is the number of years of marriage marked in a silver wedding anniversary. Is the number of years of marriage marked in a silver wedding anniversary. Is the number of years of marriage marked in a silver wedding anniversary. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 253, 244, 231),
                      height: 1.3,
                    ),
                  ),
                  const Expanded(
                      child: SizedBox(
                    height: 25,
                  )),
                  ButtonWidget(text: backButtonString, onTapped: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
