import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  void timeup(context) {
    Timer(const Duration(seconds: 5),
        () => {Navigator.of(context).pushNamed('/welcome')});
  }

  @override
  Widget build(BuildContext context) {
    timeup(context);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: Image.asset('assets/images/logo.png'),
        ),
        const SizedBox(
          height: 30.0,
        ),
        const Text(
          'Welcome to Multi App',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'cursive'),
        ),
        const SizedBox(
          height: 80.0,
        ),
        const CircularProgressIndicator()
      ],
    )));
  }
}
