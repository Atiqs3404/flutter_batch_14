import 'package:flutter/material.dart';

class Class3Draggable extends StatelessWidget {
  const Class3Draggable({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> cartItems = [
      {
        'img':
            "https://images.unsplash.com/photo-1584306670957-acf935f5033c?q=80&w=686&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        'name': 'Apple',
      },
      {
        'img':
            "https://plus.unsplash.com/premium_photo-1724250081106-4bb1be9bf950?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        'name': 'Banana',
      },
      {
        'img':
            "https://plus.unsplash.com/premium_photo-1670512181061-e24282f7ee78?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        'name': 'Orange',
      },
      {
        'img':
            "https://images.unsplash.com/photo-1673010960635-d0d1ad81b90a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        'name': 'Mango',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),

      body: ListView.builder(
        itemCount: cartItems.length,

        itemBuilder: (context, index) {
          final item = cartItems[index];

          return Dismissible(
            key: Key(item["name"]!),

            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item["name"]} quantity increased")),
                );
              } else if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item["name"]} quantity decreased")),
                );
              }
            },

            background: Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.add, color: Colors.white),
            ),

            secondaryBackground: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),

            child: Card(
              child: ListTile(
                title: Text(item["name"]!),
                leading: Image.network(item["img"]!),
                trailing: Text("QTY: 2", style: TextStyle(fontSize: 16)),
              ),
            ),
          );
        },
      ),
    );
  }
}
