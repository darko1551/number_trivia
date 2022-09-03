import 'package:flutter/material.dart';

typedef OnTapped = void Function();

class ButtonWidget extends StatelessWidget {
  final String text;
  final OnTapped onTapped;

  const ButtonWidget({Key? key, required this.text, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTapped();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 255, 196, 100),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 50),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}
