import 'package:device_preview/device_preview.dart';
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
import 'package:flutter_application_test/module_13/class_3_drag_drop.dart';
import 'package:flutter_application_test/module_13/class_3_draggable.dart';
import 'package:flutter_application_test/module_13/class_4_animation.dart';
import 'package:flutter_application_test/module_14/class_1_widget_lifecycle.dart';
import 'package:flutter_application_test/module_14/class_2_navigation.dart';
import 'package:flutter_application_test/module_14/class_3.dart';
import 'package:flutter_application_test/module_14/test_2_navigation.dart';
import 'package:flutter_application_test/module_15/class_1_bottom_nav.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,

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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          routes: {
            "/home": (context) => Home(),
            "/drag_and_drop": (context) => DragDrop(),
            "/alert": (context) => Class2AlertDialog(),
            "/listView": (context) => Class2ListViewModule12(),
            "/navigation": (context) => Class2Navigation(),

            // Receiving parameter values through name route
            "/test2": (context) {
              final arg =
                  ModalRoute.of(context)!.settings.arguments
                      as Map<String, dynamic>;
              return Test2Navigation(
                name: arg["name"],
                price: arg["price"],
                onClick: arg["onClick"],
              );
            },

            "/bar": (context) => Class3Module14(),
            "/botNav": (context) => Class1BottomNav(),
            "/medQuery": (context) => Class3Module11(),
          },

          initialRoute: "/medQuery",
        );
      },
    );
  }
}
