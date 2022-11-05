import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../BackPressDialog.dart';
import '../../main_drawer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchStatePage();
}

class _StopwatchStatePage extends State<StopwatchPage> {
  bool startisabletopressed = true;
  bool stopisabletopressed = false;
  bool resetisabletopressed = false;
  bool isstopwatchrunning = false;

  String timetodisplay = '00:00:00';
  var swatch = Stopwatch();
  var dur = const Duration(seconds: 1);

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      timetodisplay = "${swatch.elapsed.inHours.toString().padLeft(2, '0')}:${(swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}";
    });
  }

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void startStopwatch() {
    isstopwatchrunning = true;
    setState(() {
      startisabletopressed = false;
      stopisabletopressed = true;
      resetisabletopressed = false;
    });
    swatch.start();
    startTimer();
  }

  void stopStopwatch() {
    isstopwatchrunning = false;
    setState(() {
      stopisabletopressed = false;
      startisabletopressed = false;
      resetisabletopressed = true;
    });
    swatch.stop();
  }

  void resetStopwatch() {
    setState(() {
      resetisabletopressed = false;
      startisabletopressed = true;
      stopisabletopressed = false;
    });
    swatch.reset();
    timetodisplay = '00:00:00';
  }

  Future<bool> _showDialog() {
    if (isstopwatchrunning == true) {
      return BackPressDialog().showAlertPopup('StopwatchPage', context);
    }
    Navigator.of(context).pushNamed('/welcome');
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return WillPopScope(
      onWillPop: () => _showDialog(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stopwatch'),
          backgroundColor: const Color(0xFFe7e9bb),
          foregroundColor: Colors.black87,
          elevation: 0.0,
        ),
        drawer: const MainDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFe7e9bb), Color(0xFF403ba4),
            //Color(0xFFa6ffcb)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timetodisplay,
                style: const TextStyle(fontSize: 50.0),
              ),
              const SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 80.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400], // Background color
                        ),
                        onPressed: stopisabletopressed ? stopStopwatch : null,
                        child: const Text('Stop',
                            style: TextStyle(fontSize: 15.0))),
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 80.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey, // Background color
                        ),
                        onPressed: resetisabletopressed ? resetStopwatch : null,
                        child: const Text('Reset',
                            style: TextStyle(fontSize: 15.0))),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                width: 90.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                    ),
                    onPressed: startisabletopressed ? startStopwatch : null,
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 20.0),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
