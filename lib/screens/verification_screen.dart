import 'package:flutter/material.dart';
import 'package:rental_app/screens/forgotpassword_screen.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/custom_widgets/custom_textfield.dart';
import 'package:rental_app/screens/newpassword_screen.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  void _NavigateToResetScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }
  void onPressOtpResend() {
    Future.delayed(Duration(seconds: 1), () {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('OTP resent successfully')));
    });
  }

  void _navigateToNewPasswordScreen() {
    Navigator.pushReplacement(
      context,
     MaterialPageRoute(builder:   (context) => NewpasswordScreen()),
    );
  }

  void onPressVerify() {
    _navigateToNewPasswordScreen();
  }

  void onPressBack() {
    _NavigateToResetScreen();
  }

  final code = TextEditingController();

  Widget resendOtpGesture() {
    return GestureDetector(
      onTap: onPressOtpResend,
      child: Text(
        'Resend OTP',
        style: TextStyle(color: Color(0xFFED5C1D), fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: onPressBack,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(child: CustomHeading(text: 'Verify Account')),
          SizedBox(height: 20),
          CustomTextfield(hintText: 'Enter verification code', textInput: code),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Already have an account? '), resendOtpGesture()],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'Verify', onPressed: onPressVerify),
          ),
          
        ],
      ),
    );
  }
}
