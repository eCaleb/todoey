import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxCallback  (bool? checkboxState) {
        setState(() {
        isChecked = checkboxState!;
        });
      }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task',style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: AddTasksCheckbox(
        checkboxState: isChecked, toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

class AddTasksCheckbox extends StatelessWidget {
  final bool checkboxState; 
  final Function(bool?) toggleCheckboxState;
  
  const AddTasksCheckbox({
    super.key,
    required this.checkboxState, required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged:toggleCheckboxState
    );
  }
}
