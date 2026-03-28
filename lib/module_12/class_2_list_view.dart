import 'package:flutter/material.dart';

class Class2ListViewModule12 extends StatelessWidget {
  const Class2ListViewModule12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View Module 12")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Hello"),

            SizedBox(height: 20),

            Container(color: Colors.red, width: 100, height: 100),

            SizedBox(
              height: 300,

              width: double.infinity,

              child: ListView.builder(
                itemCount: 51,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(
                        "Atiq Hasan Sani",
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text("01580597473"),
                      leading: CircleAvatar(
                        child: Image.asset("assets/yt_logo.png"),
                      ),
                      trailing: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ListView.builder(
      //   itemCount: 51,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       elevation: 5,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       child: ListTile(
      //         title: Text("Atiq Hasan Sani", style: TextStyle(fontSize: 18)),
      //         subtitle: Text("01580597473"),
      //         leading: CircleAvatar(child: Image.asset("assets/yt_logo.png")),
      //         trailing: Icon(Icons.delete),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
