import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/service/tasklist.dart';
import '../models/task.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: task.name,
              decoration: const InputDecoration(
                hintText: "Masukkan nama",
              ),
              onChanged: (value) {
                context.read<Tasklist>().changeTaskName(value);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<Tasklist>().updateTask(task);
                      Navigator.pop(context, true);
                    },
                    child: const Text("Simpan Perubahan"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
