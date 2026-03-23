import 'package:flutter/material.dart';
import 'package:flutter_application_test/home.dart';
import 'package:flutter_application_test/module_10/flutter_buttons.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter Batch 14", home: FlutterButtons());
  }
}
