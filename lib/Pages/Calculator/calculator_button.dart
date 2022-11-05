import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton(
      {super.key,
      required this.text,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 55.0,
            width: 65.0,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(fillColor)),
              ),
              color: Color(fillColor),
              onPressed: () => callback(text),
              child: Text(
                text,
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: textSize),
              ),
            )));
  }
}
