import 'package:flutter/material.dart';
import 'package:myapp_2/themes.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: AppThemes.buttonTextColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: Colors.black38,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
