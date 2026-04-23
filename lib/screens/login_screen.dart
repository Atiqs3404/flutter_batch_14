import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/data/models/api_response.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/screens/forget_password_email_verify.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  _clearTextField() {
    _emailController.clear();
    _passwordController.clear();
  }

  Future<void> _signIn() async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    setState(() {
      isLoading = true;
    });

    final ApiResponse response = await ApiCaller.postRequest(
      URL: Urls.SignInUrl,
      body: requestBody,
    );

    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData["data"]);
      String accessToken = response.responseData["token"];
      AuthController.saveUserData(model, accessToken);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signed in successfully")));

      Future.delayed(Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData["data"])));
    }
  }

  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ScreenBackground(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started With",
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

                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) _signIn();
                        },
                        child: Icon(Icons.arrow_circle_right_outlined),
                      ),

                SizedBox(height: 35),

                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordEmailVerify(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                color: AppColors.pColor,
                                fontWeight: FontWeight.w600,
                              ),

                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapSignUp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
