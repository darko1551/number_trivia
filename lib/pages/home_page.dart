import 'package:flutter/material.dart';
import 'package:number_trivia/assets/strings.dart';
import 'package:number_trivia/widgets/button_widget.dart';
import 'package:number_trivia/widgets/text_field_widget.dart';

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
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: Text(
              titleString,
              style: TextStyle(
                color: Color.fromARGB(255, 50, 94, 87),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
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
          const Expanded(child: SizedBox()),
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
                    throw UnimplementedError();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: randomButtonString,
                  onTapped: () {
                    throw UnimplementedError();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
