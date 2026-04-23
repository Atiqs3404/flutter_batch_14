import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/screens/forget_password_set_password.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

class ForgetPasswordOtpVerify extends StatefulWidget {
  const ForgetPasswordOtpVerify({super.key});

  @override
  State<ForgetPasswordOtpVerify> createState() =>
      _ForgetPasswordOtpVerifyState();
}

class _ForgetPasswordOtpVerifyState extends State<ForgetPasswordOtpVerify> {
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
                "PIN Verification",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 10),

              Text(
                "Enter the pin sent to your email address",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.grey.shade600),
              ),

              SizedBox(height: 25),

              // PinInput(
              //   length: 6,

              //   obscureText: true,

              //   builder: (context, cells) {
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.center,

              //       children: cells.map((cell) {
              //         return Container(
              //           width: 45,
              //           height: 55,
              //           margin: EdgeInsets.symmetric(horizontal: 5),
              //           decoration: BoxDecoration(
              //             shape: BoxShape.rectangle,
              //             color: cell.isFocused
              //                 ? AppColors.pColor
              //                 : Colors.grey.shade400,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Center(
              //             child: Text(
              //               cell.character ?? '',
              //               style: TextStyle(fontSize: 24),
              //             ),
              //           ),
              //         );
              //       }).toList(),
              //     );
              //   },
              //   onCompleted: (pin) => print('PIN: $pin'),
              // ),
              MaterialPinField(
                length: 6,
                obscureText: true,
                blinkWhenObscuring: true,
                blinkDuration: Duration(milliseconds: 500),
                theme: MaterialPinTheme(
                  shape: MaterialPinShape.outlined,
                  cellSize: Size(48, 55),
                  borderRadius: BorderRadius.circular(10),
                  obscuringCharacter: '●',
                  fillColor: Colors.transparent,
                  focusedFillColor: Colors.grey[400],
                  filledFillColor: AppColors.pColor,
                ),
              ),

              SizedBox(height: 20),

              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordSetPassword(),
                    ),
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
