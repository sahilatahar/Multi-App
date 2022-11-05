import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../BackPressDialog.dart';
import '../../main_drawer.dart';
import 'GridContainer.dart';

class ProvideOptions extends StatelessWidget {
  const ProvideOptions({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return WillPopScope(
        onWillPop: () =>
            //It will show error in IDE but it is correct statement.
            BackPressDialog().showAlertPopup('WelcomePage', context),
        child: Scaffold(
          //backgroundColor: Colors.cyan,
          appBar: AppBar(
            //foregroundColor: Colors.blue,
            backgroundColor: const Color(0xFFEC2F4B),
            title: const Text('Multi App'),
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: const MainDrawer(),

          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFEC2F4B), Color(0xFF009FFF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: const EdgeInsets.all(20.0),
                scrollDirection: Axis.vertical,
                children: [
                  GridContainer()
                      .createGridContainer(0, '/calculator', context),
                  GridContainer().createGridContainer(
                    1,
                    '/timer',
                    context,
                  ),
                  GridContainer().createGridContainer(2, '/stopwatch', context),
                ],
              )),
        ));
  }
}
