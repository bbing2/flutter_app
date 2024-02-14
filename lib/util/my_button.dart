import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow[200],
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      onPressed: onPressed,
    );
  }
}
