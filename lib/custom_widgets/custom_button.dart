import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  }); 

  @override

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFED5C1D),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: Size(350, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}