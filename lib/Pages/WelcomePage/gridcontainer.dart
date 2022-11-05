import 'package:flutter/material.dart';

class GridContainer {

  Widget createGridContainer(int gridNum, String functionName,context) {
    final Set gridName = {'Calculator', 'Timer', 'Stopwatch'};

    final Set gridColor = {0xFF9370DB, 0xFF443544, 0xFF3CB371};

    final Set imageAdress = {
      'assets/images/calculator_icon.png',
      'assets/images/timer_icon.png',
      'assets/images/stopwatch_icon.png'
    };

    return Center(
        child: InkWell(
            onTap: () => {Navigator.of(context).pushNamed(functionName)},
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Color(gridColor.elementAt(gridNum)),
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Center(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Image.asset(
                    imageAdress.elementAt(gridNum),
                    width: 75,
                    height: 75,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    gridName.elementAt(gridNum),
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ]),
              ),
            )));
  }
}