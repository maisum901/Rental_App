import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/custom_button.dart';
import 'package:rental_app/custom_widgets/custom_heading.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/custom_widgets/custom_textfield.dart';
import 'package:rental_app/screens/home_screen.dart';
import 'package:rental_app/screens/forgotpassword_screen.dart';
import 'package:rental_app/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rental_app/custom_widgets/custom_password.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
   @override
   void initState() {
    super.initState();
   }
   
Future<bool> checkUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> emailList = prefs.getStringList('emails') ?? [];
    List<String> passwordList = prefs.getStringList('passwords') ?? [];
    for (int i = 0; i < emailList.length; i++) {
      if (emailList[i] == email && passwordList[i] == password) {
        return true;
      }
    }
    return false;

  }

  final email = TextEditingController();
  final password = TextEditingController();

  void onPressSignIn() {
    checkUser(email.text, password.text).then((exists) {
      if (exists) {
        _navigateToHomeScreen();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid email or password')));
      }
    });
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Widget forgotGesture() {
    return GestureDetector(
                  onTap: onPressedForgotPassword,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFED5C1D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
  }
  void onPressedForgotPassword() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
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
          child: Image.asset('assets/images/facebook.png', width: 40, height: 40),
        ),
      ],
    );
  }
  void onPressSignup() {
    _navigateToRegisterScreen();
  }

  void _navigateToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  Widget registerGesture() {
    return GestureDetector(
                  onTap: onPressSignup,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFFED5C1D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
  }
  void _navigateToSignupScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  void onPressedBack() {
    _navigateToSignupScreen();
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
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(child: CustomHeading(text: 'Welcome Back!')),
          SizedBox(height: 20),
          TextfieldHeading(text: 'Email Address'),
          SizedBox(height: 10),
          CustomTextfield(hintText: 'Enter your email', textInput: email),
          SizedBox(height: 20),
          TextfieldHeading(text: 'Password'),
          SizedBox(height: 10),
          CustomPassword(hintText: 'Enter your password', textInput: password),
          SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account? '),
                forgotGesture()
              ]
            ),
            SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'Sign In', onPressed: onPressSignIn),
          ),
          SizedBox(height: 20),
        
             Row(
            children: [
              Expanded(child: Divider(indent: 20,)),
              Text('Or', style: TextStyle(color: Colors.grey),),
              Expanded(child: Divider(endIndent: 20)),
            ],
          ),
          SizedBox(height: 20),
          _icons(),
          SizedBox(height: 200),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                registerGesture()
              ]
            ),
        ],
      ),
    ),
    );
  }
}