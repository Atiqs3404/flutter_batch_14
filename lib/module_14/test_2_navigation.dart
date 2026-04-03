import 'package:flutter/material.dart';

class Test2Navigation extends StatelessWidget {
  final String name;
  final int price;
  final VoidCallback onClick; // Taking method data from other page

  const Test2Navigation({
    super.key,
    required this.name,
    required this.price,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(name, style: TextStyle(fontSize: 20)),
            Text(price.toString(), style: TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            ElevatedButton(onPressed: onClick, child: Text("ONCLICK")),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Simply goes to the previous page
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
