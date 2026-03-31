import 'package:flutter/material.dart';
import 'package:flutter_application_test/home.dart';
import 'package:flutter_application_test/module_10/flutter_buttons.dart';
import 'package:flutter_application_test/module_11/class_1.dart';
import 'package:flutter_application_test/module_11/class_2.dart';
import 'package:flutter_application_test/module_11/class_3.dart';
import 'package:flutter_application_test/module_12/class_1.dart';
import 'package:flutter_application_test/module_12/class_1_grid_view.dart';
import 'package:flutter_application_test/module_12/class_2_list_view.dart';
import 'package:flutter_application_test/module_12/class_2_list_view_expanded.dart';
import 'package:flutter_application_test/module_13/class_1_custom_widget_usage.dart';
import 'package:flutter_application_test/module_13/class_2_alert_types.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Batch 14",

      theme: ThemeData(
        brightness: Brightness.light,

        // brightness: Brightness.dark,
        primaryColor: Colors.grey.shade300,

        primarySwatch: Colors.deepOrange,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),

        // textTheme: TextTheme(titleLarge: TextStyle(fontSize: 32), ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 18),
          labelStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      home: Class2AlertDialog(),
    );
  }
}
