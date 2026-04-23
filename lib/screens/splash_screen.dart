import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/utils/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goToLoginScreen() async {
    await Future.delayed(Duration(seconds: 3));

    await AuthController.getUserData();
    final isLoggedIn = await AuthController.isUserLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    goToLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetPath.backgroundSVG),

          Center(child: SvgPicture.asset(AssetPath.logoSVG)),
        ],
      ),
    );
  }
}
