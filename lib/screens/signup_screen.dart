import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/custom_widgets/custom_textfield.dart';
import 'package:rental_app/screens/signin_screen.dart';
import 'package:rental_app/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rental_app/custom_widgets/custom_password.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  void onPressSignup() {
    _onPressSignupButton();
  }

  Future<bool> userExists(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> emailList = prefs.getStringList('emails') ?? [];
    return emailList.contains(email);
  }

  Future<void> saveUser(String email, String password, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> emailList = prefs.getStringList('emails') ?? [];
    List<String> passwordList = prefs.getStringList('passwords') ?? [];
    List<String> nameList = prefs.getStringList('names') ?? [];
    setState(() {
      emailList.add(email);
      passwordList.add(password);
      nameList.add(name);
    });
    await prefs.setStringList('emails', emailList);
    await prefs.setStringList('passwords', passwordList);
    await prefs.setStringList('names', nameList);
  }

  void _onPressSignupButton() async {
    if (email.text.isEmpty || password.text.isEmpty || name.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    } else if (await userExists(email.text)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User already exists')));
      return;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email.text)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a valid email')));
      return;
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password must be at least 8 characters')),
      );
      return;
    } else if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to the Terms and Conditions')),
      );
      return;
    } else {
      await saveUser(email.text, password.text, name.text);
      await Future.delayed(Duration(seconds: 1));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signup successful!')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    }
  }

  bool isChecked = false;
  Widget _checkTerms() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text('I agree to the Terms and Conditions'),
      ],
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
        style: TextStyle(color: Color(0xFFED5C1D), fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset('assets/images/google.png', width: 25, height: 25),
        ),
        SizedBox(width: 20),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            'assets/images/facebook.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }

  void _navigateToOnboardingScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  void onPressedOnboarding() {
    _navigateToOnboardingScreen();
  }
  // String email = '';
  // String password = '';
  // String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: onPressedOnboarding,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(child: CustomHeading(text: 'Create Account')),
            SizedBox(height: 20),
            TextfieldHeading(text: 'Name'),
            SizedBox(height: 5),
            CustomTextfield(hintText: 'Enter your name', textInput: name),
            SizedBox(height: 10),
            TextfieldHeading(text: 'Email Address'),
            SizedBox(height: 10),
            CustomTextfield(hintText: 'Enter your email', textInput: email),
            SizedBox(height: 10),
            TextfieldHeading(text: 'Password'),
            SizedBox(height: 10),
            CustomPassword(
              hintText: 'Enter your password',
              textInput: password,
            ),
            SizedBox(height: 10),
            _checkTerms(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(text: 'Register', onPressed: onPressSignup),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(indent: 20)),
                Text('Or', style: TextStyle(color: Colors.grey)),
                Expanded(child: Divider(endIndent: 20)),
              ],
            ),
            SizedBox(height: 20),
            _icons(),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Already have an account? '), loginGesture()],
            ),
          ],
        ),
      ),
    );
  }
}
