import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  
  final TextEditingController _controller =
      TextEditingController();

  AddTaskScreen({super.key}); // Controller for TextField

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(
                fontSize: 29,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              onChanged: (newText){
                _controller.text = newText;
              },
              textAlign: TextAlign.center,
              autofocus: true,
              cursorColor: Colors.lightBlueAccent, // Set cursor color
              style: const TextStyle(
                color: Colors.lightBlueAccent, // Text color
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 3, // Make the underline thicker
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 3, // Make the underline thicker
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    width: 3, // Maintain thickness in disabled state
                  ),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 130),
                backgroundColor: Colors.lightBlueAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<TaskData>(context,listen: false).addTask(_controller.text);
                  Navigator.pop(context); // Close the screen
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
