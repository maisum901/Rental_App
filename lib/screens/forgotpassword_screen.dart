import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/custom_widgets/custom_textfield.dart';
import 'package:rental_app/screens/verification_screen.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final email = TextEditingController();

  void onPressReset() {
    _navigateToResetScreen();
  }

  void _navigateToResetScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen()),
    );
  }

  void onPressedBack() {
    _navigateToResetScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: onPressedBack,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(child: CustomHeading(text: 'Forgot Password')),
          SizedBox(height: 20),
          TextfieldHeading(text: 'Email Address'),
          SizedBox(height: 10),
          CustomTextfield(hintText: 'Enter your email', textInput: email),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'Send Code', onPressed: onPressReset),
          ),
        ],
      ),
    );
  }
}