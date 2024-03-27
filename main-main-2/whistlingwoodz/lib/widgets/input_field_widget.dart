import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';

// This class for the design of all input fields in the login form and registration form
class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obsecureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obsecureText,
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
        onChanged:(value){
            
        },
        // Input text enters at centre and cursor colour
        textAlign: TextAlign.center,
        cursorColor: colorWhite,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            icon,
            color: colorWhite,
            size: 25.0,
          ),
          // Hint text colour
          focusColor: colorWhite,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: colorGrey,
            fontSize: 12.0,
            fontFamily: 'Montserrat',
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorWhite),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorWhite),
          ),
          contentPadding: const EdgeInsets.only(top: 15.0),
        ),
      ),
    );
  }
}
