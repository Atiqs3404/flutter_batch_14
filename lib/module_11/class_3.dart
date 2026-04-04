import 'package:flutter/material.dart';

class Class3Module11 extends StatelessWidget {
  const Class3Module11({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(title: Text("Theme Data Class 3")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(width: 200, height: 30, "assets/yt_logo.png"),

                  SizedBox(height: 20),

                  // TextField(
                  //   keyboardType: TextInputType.visiblePassword,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter your password",
                  //     labelText: "Password",
                  //   ),
                  // ),
                  SizedBox(height: 10),

                  ElevatedButton(onPressed: () {}, child: Text("Theme Button")),

                  SizedBox(height: 20),

                  Container(width: 200, height: 150, color: Colors.red),

                  SizedBox(height: 20),

                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.2,
                    color: Colors.blue,
                  ),

                  Text(
                    "Responsive text",
                    style: TextStyle(fontSize: 0.03 * screenWidth),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
