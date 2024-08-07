// task_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return const Center(child: Text('No tasks available'));
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => AddTaskView());
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
