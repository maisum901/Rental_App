import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/screens/signup_screen.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/screens/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void onPressed() {
    _navigateToNextScreen();
  }
  Future<void> _navigateToNextScreen() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  
  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninScreen()),
    );
  }
  void onPressedLogin() {
    _navigateToLoginScreen();
  }
  Widget loginGesture() {
    return GestureDetector(
                  onTap: onPressedLogin,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFFED5C1D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset('assets/images/images.png', width: 350, height: 350, fit: BoxFit.cover),
            SizedBox(height: 50),
            CustomHeading(text: "Let's Get Started!"),
            SizedBox(height: 20),
            Text('Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. \nDonec vel sapien augue.',textAlign: TextAlign.center,),
            SizedBox(height: 40),
            CustomButton(text: 'Register' , onPressed: onPressed),
            SizedBox(height: 135),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                loginGesture()
              ]
            ),
            ],
        ),
      ),
       
    );
  }
}
