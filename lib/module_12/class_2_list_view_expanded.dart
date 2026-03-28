import 'package:flutter/material.dart';

class Class2ListViewExpanded extends StatelessWidget {
  const Class2ListViewExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded List View")),

      body: Column(
        children: [
          Text("Hello", style: TextStyle(fontSize: 25)),

          SizedBox(height: 10),

          Container(height: 70, width: 100, color: Colors.red),

          // hasSize issue solved with SizedBox or Container
          SizedBox(
            height: 200,

            child: Container(
              color: Colors.red,
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
          ),

          Divider(height: 10, thickness: 10, color: Colors.blue),

          // hasSize issue solved with Expanded
          // Expanded forces to take space.
          // Expanded takes fully available space.
          Expanded(
            child: Container(
              color: Colors.amber,
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
          ),

          Divider(height: 10, thickness: 10, color: Colors.purple),

          // hasSize issue solved with Flexible
          // Flexible does not force to take space.
          // Flexible shares space with other widgets
          Flexible(
            child: Container(
              color: Colors.black,
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
          ),
        ],
      ),
    );
  }
}
