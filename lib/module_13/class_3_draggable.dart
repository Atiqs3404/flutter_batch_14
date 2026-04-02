import 'package:flutter/material.dart';

class Class3Draggable extends StatelessWidget {
  const Class3Draggable({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> destinationList = [
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1718035557075-5111d9d906d2?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Paris",
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1680339680335-7e3b8572fc00?q=80&w=1075&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Maldives",
      },
      {
        "img":
            "https://images.unsplash.com/photo-1489516408517-0c0a15662682?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Dubai",
      },
      {
        "img":
            "https://images.unsplash.com/photo-1604999333679-b86d54738315?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Bali",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),

      body: ListView.builder(
        itemCount: destinationList.length,

        itemBuilder: (context, index) {
          final item = destinationList[index];

          return Dismissible(
            key: Key(item["name"]!),

            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item["name"]} quantity increase")),
                );
              } else if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item["name"]} quantity decreased")),
                );
              }
            },

            background: Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.add, size: 30),
            ),

            secondaryBackground: Container(
              color: Colors.deepOrange,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.delete, size: 30),
            ),

            child: Card(
              child: ListTile(
                leading: Image.network(item["img"]!),
                title: Text(item["name"]!),
                trailing: Text("Qty 2", style: TextStyle(fontSize: 20)),
              ),
            ),
          );
        },
      ),
    );
  }
}
