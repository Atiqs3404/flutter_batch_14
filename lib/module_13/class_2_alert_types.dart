import 'package:flutter/material.dart';

class Class2AlertDialog extends StatelessWidget {
  const Class2AlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertDialogue() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(width: 4, color: Colors.amber),
          ),
          // backgroundColor: Colors.amberAccent.shade100,
          icon: Icon(Icons.delete, size: 30, color: Colors.deepOrange),
          title: Text("This is alert title"),
          content: Text("This is alert content"),
          actions: [
            TextButton(onPressed: () {}, child: Text("Yes")),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        ),
      );
    }

    void showSimpleDialogue() {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text("Simple Dialogue"),
          children: [
            SimpleDialogOption(onPressed: () {}, child: Text("English")),
            SimpleDialogOption(child: Text("Bangla")),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Enter your age"),
                  TextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Save")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    void showSnackbar() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item deleted"),
          action: SnackBarAction(label: "Undo", onPressed: () {}),
        ),
      );
    }

    void showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text("Choose option"),
              ListTile(title: Text("Option 1")),
              ListTile(title: Text("Option 2")),
              ListTile(title: Text("Option 3")),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Alert")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertDialogue();
              },
              child: Text("Alert Dialogue"),
            ),
            ElevatedButton(
              onPressed: () {
                showSimpleDialogue();
              },
              child: Text("Simple Dialogue"),
            ),
            ElevatedButton(
              onPressed: () {
                showSnackbar();
              },
              child: Text("Simple Snackbar"),
            ),
            ElevatedButton(
              onPressed: () {
                showBottomSheet();
              },
              child: Text("Bottom sheet"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: [Text("Add"), Icon(Icons.add)]),
        ),
      ),
    );
  }
}
