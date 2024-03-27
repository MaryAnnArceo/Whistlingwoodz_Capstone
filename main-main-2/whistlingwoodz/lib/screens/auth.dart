// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/login_screen.dart';
import 'package:whistlingwoodz/screens/registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    required this.error,
  });
  final bool error;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
          showRegistrationPage: toggleScreens, error: widget.error);
    } else {
      return RegistrationScreen(showLoginPage: toggleScreens);
    }
  }
}
