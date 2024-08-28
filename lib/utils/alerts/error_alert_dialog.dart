import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

errorAlertDialog(
    {required BuildContext context,
    required String error,
    required IconData iconData,
    required String buttonText}) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) {
          Size size = MediaQuery.of(context).size;
          ThemeData theme = Theme.of(context);
          return Dialog(
            backgroundColor: theme.cardColor,
            surfaceTintColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.error_outline_rounded,
                        color: theme.colorScheme.error, size: 50),
                    Text(
                      textAlign: TextAlign.center,
                      "Oh no!\n Algo salió mal.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      error,
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 40,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                            //  color: activeColor,
                            border: Border.all(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style:  TextStyle(
                                color: theme.primaryColor,
                                fontSize: 14,
                              ),
                            ),
                          )),
                    )
                  ]),
            ),
          );
        });
  } else {
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      color: Colors.red.shade900,
                      size: 40,
                    ),
                  ),
                  const Text("Oh no!\n something went wrong."),
                ],
              ),
              content: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    error,
                    style: TextStyle(
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
