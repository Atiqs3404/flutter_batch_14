import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/forget_password_otp_verify.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

class ForgetPasswordSetPassword extends StatefulWidget {
  const ForgetPasswordSetPassword({super.key});

  @override
  State<ForgetPasswordSetPassword> createState() =>
      _ForgetPasswordSetPasswordState();
}

class _ForgetPasswordSetPasswordState extends State<ForgetPasswordSetPassword> {
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
                "Set Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 10),

              Text(
                "Minimum length password 8 character with Letter and number combination",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.grey.shade600),
              ),

              SizedBox(height: 25),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),

              SizedBox(height: 10),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Confirm Password"),
              ),

              SizedBox(height: 20),

              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
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
