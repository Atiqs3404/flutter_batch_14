import 'package:flutter/material.dart';

class Class1GridViewModule12 extends StatelessWidget {
  const Class1GridViewModule12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View")),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),

      //   child: GridView.count(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 8,
      //     mainAxisSpacing: 8,

      //     children: [
      //       Container(color: Colors.red),
      //       Container(color: Colors.red),
      //       Container(color: Colors.red),
      //       Container(color: Colors.red),
      //       Container(color: Colors.red),
      //     ],
      //   ),
      // ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   index.toString(),
                        //   style: TextStyle(color: Colors.white, fontSize: 18),
                        // ),
                        Icon(Icons.phone, size: 40, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Text("Make a call", style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
