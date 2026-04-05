import 'package:flutter/material.dart';

class buildList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final bool isEarning;

  const buildList({super.key, required this.items, required this.isEarning});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isEarning ? Colors.green : Colors.red,
              child: Icon(
                isEarning ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            title: Text(items[index]['title']),
            subtitle: Text(items[index]['date'].toString()),
            trailing: Text(
              items[index]['amount'].toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
