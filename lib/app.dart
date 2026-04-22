import 'package:flutter/material.dart';
import 'package:task_manager/screens/splash_screen.dart';
import 'package:task_manager/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),

        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,

          filled: true,

          hintStyle: TextStyle(color: Colors.grey),

          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),

          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.pColor,

            fixedSize: Size.fromWidth(double.maxFinite),

            padding: EdgeInsets.symmetric(vertical: 10),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
