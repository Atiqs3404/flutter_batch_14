import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_15/widget/build_list.dart';
import 'package:flutter_application_test/module_15/widget/build_summary_card.dart';

class MoneyManagement extends StatefulWidget {
  const MoneyManagement({super.key});

  @override
  State<MoneyManagement> createState() => _MoneyManagementState();
}

class _MoneyManagementState extends State<MoneyManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> expense = [];
  List<Map<String, dynamic>> earning = [];

  double get totalExpense =>
      expense.fold(0, (sum, item) => sum + item['amount']);
  double get totalEarning =>
      earning.fold(0, (sum, item) => sum + item['amount']);
  double get balance => totalEarning - totalExpense;

  void _showForm(bool isEarning) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    DateTime entryDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEarning ? 'Add Earning' : 'Add Expense',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    if (isEarning) {
                      setState(() {
                        earning.add({
                          'title': titleController.text,
                          'amount': double.tryParse(amountController.text),
                          'date': entryDate,
                        });
                      });
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      expense.add({
                        'title': titleController.text,
                        'amount': double.tryParse(amountController.text),
                        'date': entryDate,
                      });

                      setState(() {});
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  _showForm(true);
                },
                child: Text('Add Earning'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  _showForm(false);
                },
                child: Text('Add Expense'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money M', style: TextStyle(fontSize: 20)),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Earning', icon: Icon(Icons.arrow_upward)),
            Tab(text: 'Expense', icon: Icon(Icons.arrow_downward)),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              buildSummaryCard(
                title: 'Earning',
                amount: totalEarning,
                cardColor: Colors.green,
              ),
              buildSummaryCard(
                title: 'Expense',
                amount: totalExpense,
                cardColor: Colors.red,
              ),
              buildSummaryCard(
                title: 'Balance',
                amount: balance,
                cardColor: Colors.blue,
              ),
            ],
          ),

          SizedBox(height: 10),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildList(items: earning, isEarning: true),
                buildList(items: expense, isEarning: false),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOptions(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
