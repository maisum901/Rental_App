import 'package:flutter/material.dart';
import 'package:rental_app/screens/onboarding_screen.dart';
import 'package:rental_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> getLoggedInEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString('loggedInEmail');
    return loggedInEmail != null && loggedInEmail.isNotEmpty;
  }
  @override
  void initState() {
    super.initState();
    if (getLoggedInEmail() == true) {
      navigateToHomeScreen();
    } else {
      navigateToOnboarding();
    }
  }
  Future<void> navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }
  Future<void> navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'RENTAL',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFED5C1D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
