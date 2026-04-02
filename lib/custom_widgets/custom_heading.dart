import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String text;

  const CustomHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}