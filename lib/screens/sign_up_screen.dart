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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join With Us",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 25),

                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email address";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(hintText: "First Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your first name";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(hintText: "Last Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your last name";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: _mobileController,
                      decoration: InputDecoration(hintText: "Mobile"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter mobile number";
                        } else if (value.length != 11) {
                          return "Phone number must be 11 digits";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length != 6) {
                          return "Password must be at least 6 characters long";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 20),

                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
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

                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapLogin,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
