import 'package:flutter/material.dart';
import 'Pages/Calculator/calculator_page.dart';
import 'Pages/Stopwatch/stopwatch_page.dart';
import 'Pages/Timer/timer_page.dart';
import 'Pages/WelcomePage/welcome_page.dart';
import 'splash_page.dart';

void main() {
  runApp(const MyCalculatorClass());
}

class MyCalculatorClass extends StatelessWidget {
  const MyCalculatorClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      // color: Colors.blueGrey,
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (context) => const SplashPage(),
        '/welcome': (context) => const ProvideOptions(),
        '/calculator': (context) => const CalculationProcess(),
        '/timer': (context) => const TimerPage(),
        '/stopwatch': (context) => const StopwatchPage(),
        '/': (context) => const CalculationProcess(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
