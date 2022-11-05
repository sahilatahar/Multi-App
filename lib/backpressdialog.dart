import 'dart:io';

import 'package:flutter/material.dart';

class BackPressDialog {
  String message = '';
  String title = '';

  void getMessage(String pageName) {
    if (pageName.compareTo('WelcomePage') == 0) {
      message = 'Do you want to exit form this app?';
    } else {
      message = 'Do you want to go back?';
    }
  }

  void gettitle(String pageName) {
    if (pageName.compareTo('WelcomePage') == 0) {
      title = 'Exit app';
    } else {
      title = 'Confirm';
    }
  }

  void getFunction(String pageName, context) {
    if (pageName.compareTo('WelcomePage') == 0) {
      exit(0);
    } else {
      Navigator.of(context).pushNamed('/welcome');
    }
  }

  Future<bool> showAlertPopup(String pageName, context) async {
    gettitle(pageName);
    getMessage(pageName);

    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => getFunction(pageName, context),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
