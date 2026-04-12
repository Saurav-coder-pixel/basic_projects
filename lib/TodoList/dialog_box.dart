import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: onCancel,
                    child: Text("Cancel",
                      style: TextStyle(color: Colors.deepPurple),
                    )),

                SizedBox(width: 5),

                ElevatedButton(
                    onPressed: onSave,
                    child: Text("Add",
                      style: TextStyle(color: Colors.deepPurple),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
