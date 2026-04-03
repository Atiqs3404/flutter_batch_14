import 'package:flutter/material.dart';

class DragDrop extends StatelessWidget {
  const DragDrop({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fruits = ["Apple", "Banana", "Orange", "Mango"];
    List<String> basket = [];

    return Scaffold(
      appBar: AppBar(title: Text('DragDrop shopping')),
      body: Column(
        children: [
          SizedBox(
            height: 160,
            child: Row(
              children: fruits.map((fruit) {
                // Draggable Section
                return Draggable(
                  data: fruit,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Chip(
                      label: Text(fruit),
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),
                  childWhenDragging: Opacity(
                    opacity: 0.4,
                    child: Chip(label: Text(fruit)),
                  ),
                  child: Chip(label: Text(fruit)),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 50),

          // Target Container
          DragTarget<String>(
            onAccept: (receivedItem) {
              basket.add(receivedItem);
            },
            builder: (context, candidData, rejectedData) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  border: Border.all(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: basket.isEmpty
                    ? Center(child: Text("Drag item here to add to basket"))
                    : Wrap(
                        children: basket
                            .map(
                              (item) => Chip(
                                label: Text(item),
                                backgroundColor: Colors.orange[300],
                              ),
                            )
                            .toList(),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
