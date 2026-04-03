import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_14/class_1_widget_lifecycle.dart';
import 'package:flutter_application_test/module_14/test_1_navigation.dart';

class Class2Navigation extends StatefulWidget {
  const Class2Navigation({super.key});

  @override
  State<Class2Navigation> createState() => _Class2NavigationState();
}

class _Class2NavigationState extends State<Class2Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () {
                // Keeps the previous page history and back button
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => Class1WidgetLifecycle(),
                  ),
                );
              },

              child: Text("Home"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Keeps the previous page history and back button

                // Passing data through navigator
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => Test1Navigation(
                      name: 'Apple',
                      price: 300,
                      onClick: () {
                        print("Hello from home page");
                      },
                    ),
                  ),
                );
              },

              child: Text("Test 1 Navigation"),
            ),

            SizedBox(height: 20),

            // Name Routes
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/drag_and_drop");
              },
              child: Text("Draggable"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/test2",
                  arguments: {
                    "name": "Banana",
                    "price": 299,
                    "onClick": () {
                      print("Name routes");
                    },
                  },
                );
              },
              child: Text("Test with arg"),
            ),
          ],
        ),
      ),
    );
  }
}
