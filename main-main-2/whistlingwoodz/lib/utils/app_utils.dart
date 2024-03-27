import 'package:flutter/material.dart';

// color collection
const Color colorWhite = Colors.white;
const Color colorPrimary = Color.fromARGB(255, 139, 46, 43);
const Color colorGrey = Colors.grey;
const appBackGroundColor = Color(0xff510400);
const centerColor = Color.fromARGB(255, 139, 46, 43);
const bottomNavigationColor = Colors.black;

const String fontFamily = 'Montserrat';

// This method is used for validation method in the login and registration screen.
showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
