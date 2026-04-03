import 'package:flutter/material.dart';

class Class1WidgetLifecycle extends StatefulWidget {
  Class1WidgetLifecycle({super.key}) {
    print("1 constructor");
  }

  @override
  State<Class1WidgetLifecycle> createState() {
    print("2 create state");
    return _Class1WidgetLifecycleState();
  }
}

class _Class1WidgetLifecycleState extends State<Class1WidgetLifecycle> {
  // Must be outside of the widget
  int number = 0;

  @override
  void initState() {
    // Task before build
    super.initState();
    print("3 init state");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // Rebuild all the things inside of this build widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter app")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                      print(number);
                    });
                  },
                  child: Text("+", style: TextStyle(fontSize: 35)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number--;
                      print(number);
                    });
                  },
                  child: Text("-", style: TextStyle(fontSize: 35)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
