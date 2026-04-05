import 'package:flutter/material.dart';

class buildSummaryCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final double amount;
  const buildSummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(title, style: TextStyle(fontSize: 16)),
              Text(
                amount.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
