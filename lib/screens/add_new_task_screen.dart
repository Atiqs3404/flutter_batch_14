import 'package:flutter/material.dart';
import 'package:task_manager/data/models/api_response.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/tm_appbar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool isLoading = false;

  Future<void> _addNewTask() async {
    Map<String, dynamic> requestBody = {
      "title": _titleController.text,
      "description": _descriptionController.text,
      "status": "New",
    };

    setState(() {
      isLoading = true;
    });

    final ApiResponse response = await ApiCaller.postRequest(
      URL: Urls.createTaskUrl,
      body: requestBody,
    );

    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Task created successfully")));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
        (predicate) => false,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData["data"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),

      body: ScreenBackground(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),

                  Text(
                    "Add New Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter task title";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: _descriptionController,

                    maxLines: 10, // To make textFormFields bigger

                    decoration: InputDecoration(hintText: "Description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter task description";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 20),

                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addNewTask();
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
