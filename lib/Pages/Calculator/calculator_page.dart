import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../backpressdialog.dart';
import '../../main_drawer.dart';
import 'calculator_button.dart';

class CalculationProcess extends StatefulWidget {
  const CalculationProcess({Key? key}) : super(key: key);

  @override
  State<CalculationProcess> createState() => _CalculationProcessState();
}

class _CalculationProcessState extends State<CalculationProcess> {
  var firstNum = 0;
  var secondNum = 0;
  String history = "";
  String textToDisplay = "";
  String res = '';
  String operation = '';

  void btnOnClick(btnValue) {
    if (btnValue == 'C') {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = '';
      res = '';
    } else if (btnValue == 'AC') {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = '';
      res = '';
      history = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'x' ||
        btnValue == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnValue;
      history = firstNum.toString() + operation;
    } else if (btnValue == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnValue == 'Del') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnValue == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = (int.parse(textToDisplay + btnValue)).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return WillPopScope(
        onWillPop: () =>
            //It will show error in IDE but it is correct statement.
            BackPressDialog().showAlertPopup('CalculatorPage', context),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text("Calculator"),
            ),
            drawer: const MainDrawer(),
            backgroundColor: const Color(0xff28527a),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  alignment: const Alignment(1.0, 1.0),
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    history,
                    style: const TextStyle(
                      color: Color(0x66ffffff),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Container(
                  alignment: const Alignment(1.0, 1.0),
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    textToDisplay,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                        text: 'AC',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 20,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: 'C',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 24,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: 'Del',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 20,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '+',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 24,
                        callback: btnOnClick),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                        text: '7',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '8',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '9',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '-',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 30,
                        callback: btnOnClick),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                        text: '4',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '5',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '6',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: 'x',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 24,
                        callback: btnOnClick),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                        text: '1',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '2',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '3',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '/',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 24,
                        callback: btnOnClick),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                        text: '+/-',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 22,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '0',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '00',
                        fillColor: 0xff8ac4d0,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                    CalculatorButton(
                        text: '=',
                        fillColor: 0xfff4d160,
                        textColor: 0xff000000,
                        textSize: 26,
                        callback: btnOnClick),
                  ]),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
            ])));
  }
}
