import 'dart:math';

import 'package:flutter/material.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Flutter Buttons", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                print("Clicked");
              },
              child: Text("Elevated Button", style: TextStyle(fontSize: 24)),
            ),

            SizedBox(height: 30),

            SizedBox(
              // width: double.infinity,
              width: 300,
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  print("Clicked");
                },
                child: Text("Elevated Button", style: TextStyle(fontSize: 24)),
              ),
            ),

            SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),

            SizedBox(height: 20),
            GestureDetector(
              onDoubleTap: () => print("Double tapped text button"),
              child: TextButton(onPressed: () {}, child: Text("Text Button")),
            ),

            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                print("Delete icon pressed");
              },
              icon: Icon(Icons.delete, size: 50),
            ),

            SizedBox(height: 20),
            GestureDetector(
              onTap: () => print("Tapped the text"),
              onDoubleTap: () => print("Double tapped the text"),
              onLongPress: () => print("Long pressed the text"),
              child: Text(
                "This is a normal text",
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(height: 20),
            InkWell(
              onTap: () => print("Inkwell text tapped"),
              onDoubleTap: () => print("Inkwell text double tapped"),
              child: Text(
                "This a inkwell test text",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
