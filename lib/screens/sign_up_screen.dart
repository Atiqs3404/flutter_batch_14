import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _onTapLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ScreenBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join With Us",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 25),

              TextFormField(decoration: InputDecoration(hintText: "Email")),

              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(hintText: "First Name"),
              ),

              SizedBox(height: 10),

              TextFormField(decoration: InputDecoration(hintText: "Last Name")),

              SizedBox(height: 10),

              TextFormField(decoration: InputDecoration(hintText: "Mobile")),

              SizedBox(height: 10),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),

              SizedBox(height: 20),

              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),

              SizedBox(height: 35),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: AppColors.pColor,
                          fontWeight: FontWeight.w600,
                        ),

                        recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
