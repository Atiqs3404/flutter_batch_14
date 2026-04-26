import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/show_snackBar.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key,
    required this.taskModel,
    required this.cardColor,
    required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Future<void> deleteTask() async {
    final response = await ApiCaller.getRequest(
      URL: Urls.deleteTaskUrl(widget.taskModel.sId!),
    );

    if (response.isSuccess) {
      widget.refreshParent();
      showSnackbar(context, "Task deleted");
    } else {
      showSnackbar(context, response.responseData["data"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            widget.taskModel.title!,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 18),
          ),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description!),

              Text("Date: ${widget.taskModel.createdDate!}"),

              Row(
                children: [
                  Chip(
                    label: Text(widget.taskModel.status!),
                    backgroundColor: widget.cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_note_rounded, color: Colors.orange),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask();
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
