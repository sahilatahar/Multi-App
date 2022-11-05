import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(5.0), children: [
        Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Multi App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white),
                )
              ],
            )),
        ListTile(
          leading: const Icon(Icons.calculate_outlined),
          focusColor: Colors.blue,
          selectedTileColor: Colors.black12,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/calculator");
          },
          title: const Text(
            'Calculator',
          ),
        ),
        ListTile(
          leading: const Icon(Icons.access_time),
          focusColor: Colors.blue,
          selectedTileColor: Colors.black12,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/timer");
          },
          title: const Text(
            'Timer',
          ),
        ),
        ListTile(
          leading: const Icon(Icons.access_alarm),
          focusColor: Colors.blue,
          selectedTileColor: Colors.black12,
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/stopwatch");
          },
          title: const Text(
            'Stopwatch',
          ),
        ),
      ]),
    );
  }
}
