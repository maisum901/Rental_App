import 'package:flutter/material.dart';
import 'package:rental_app/screens/verification_screen.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/screens/signin_screen.dart';
import 'package:rental_app/custom_widgets/custom_password.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreenState();
}

class _NewpasswordScreenState extends State<NewpasswordScreen> {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  void _navigateToVerificationScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen()),
    );
  }

  void _navigateToSignInScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninScreen()),
    );
  }

  void onPressReset() {
    _navigateToSignInScreen();
  }

  void onPressBack() {
    _navigateToVerificationScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: onPressBack,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(child: CustomHeading(text: 'New Password')),
          SizedBox(height: 10),
          TextfieldHeading(text: 'New Password'),
          SizedBox(height: 10),
          CustomPassword(
            hintText: 'Enter new password',
            textInput: newPassword,
          ),
          SizedBox(height: 10),
          TextfieldHeading(text: 'Confirm New Password'),
          SizedBox(height: 10),
          CustomPassword(
            hintText: 'Confirm new password',
            textInput: confirmPassword,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'Reset Password', onPressed: onPressReset),
          ),
        ],
      ),
    );
  }
}
