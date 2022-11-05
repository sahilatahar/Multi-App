import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../backpressdialog.dart';
import '../../main_drawer.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerStatePage();
}

class _TimerStatePage extends State<TimerPage> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  int timeinsecond = 0;
  bool startisabletopress = true;
  bool stopisabletopress = false;
  bool checktimer = true;
  bool istimerrunning = false;
  String timetodisplay = '';

  var dur = const Duration(seconds: 1);

  void start() {
    istimerrunning = true;
    startisabletopress = false;
    stopisabletopress = true;
    timeinsecond = (hour * 60 * 60) + (min * 60) + sec;
    Timer.periodic(dur, (Timer t) {
      setState(() {
        if (timeinsecond < 1 || checktimer == false) {
          t.cancel();
          startisabletopress = true;
          stopisabletopress = false;
          Navigator.pushReplacementNamed(context, '/timer');
        } else if (timeinsecond < 60) {
          timetodisplay = timeinsecond.toString();
          timeinsecond = timeinsecond - 1;
        } else if (timeinsecond < 3600) {
          int m = timeinsecond ~/ 60;
          int s = timeinsecond - (60 * m);
          timetodisplay = "${m.toString()}:${s.toString()}";
          timeinsecond = timeinsecond - 1;
        } else {
          int h = timeinsecond ~/ 3600;
          int t = timeinsecond - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay = "${h.toString()}:${m.toString()}:${s.toString()}";
          timeinsecond = timeinsecond - 1;
        }
      });
    });
  }

  void stop() {
    stopisabletopress = false;
    startisabletopress = true;
    checktimer = false;
  }

  Future<bool> _showDialog() {
    if (istimerrunning == true) {
      return BackPressDialog().showAlertPopup('TimerPage', context);
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
            title: const Text('Timer'),
            backgroundColor: const Color(0xfffffbd5),
            foregroundColor: Colors.black,
            elevation: 0.0,
          ),
          drawer: const MainDrawer(),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              // Color(0xfffeac5e),
              Color(0xfffffbd5),
              Color(0xff108dc6),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HH',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        NumberPicker(
                          itemHeight: 50.0,
                          itemWidth: 50.0,
                          value: hour,
                          onChanged: (value) {
                            setState(() {
                              hour = value;
                            });
                          },
                          minValue: 0,
                          maxValue: 23,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'MM',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        NumberPicker(
                          itemWidth: 50.0,
                          value: min,
                          onChanged: (value) {
                            setState(() {
                              min = value;
                            });
                          },
                          minValue: 0,
                          maxValue: 59,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'SS',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        NumberPicker(
                          itemWidth: 50.0,
                          value: sec,
                          onChanged: (value) {
                            setState(() {
                              sec = value;
                            });
                          },
                          minValue: 0,
                          maxValue: 59,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      timetodisplay,
                      style: const TextStyle(fontSize: 50.0),
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 90.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green, // Background color
                              ),
                              onPressed: startisabletopress ? start : null,
                              child: const Text(
                                'Start',
                                style: TextStyle(fontSize: 20.0),
                              )),
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 80.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red[400], // Background color
                              ),
                              onPressed: stopisabletopress ? stop : null,
                              child: const Text('Stop',
                                  style: TextStyle(fontSize: 15.0))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
