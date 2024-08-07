import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/core/service/appwrite_client.dart';
import 'task_controller.dart';

import 'package:task_managment/task/task_controller.dart';
import 'package:uuid/uuid.dart';

class TasksView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    // controller.fetchTask();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Obx(() {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                task: controller.tasks[index],
                // onTap: () => controller.toggleTaskCompletion(index),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showAddTaskBottomSheet(context),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  showAddTaskBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(labelText: 'Task Name'),
                  ),
                  DropdownButtonFormField<String>(
                    value: controller.selectedCategory,
                    items: controller.categories
                        .map((category) => DropdownMenuItem(
                            value: category, child: Text(category)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedCategory = value!;
                    },
                    decoration: InputDecoration(labelText: 'Category'),
                  ),
                  TextField(
                    controller: controller.dueDateController,
                    decoration: InputDecoration(
                      labelText: 'Due Date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.dueDateController.text =
                                pickedDate.toLocal().toString().split(' ')[0];
                          }
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: controller.labelsController,
                    decoration: InputDecoration(labelText: 'Labels'),
                  ),
                  DropdownButtonFormField<String>(
                    value: controller.selectedStatus,
                    items: controller.statuses
                        .map((status) => DropdownMenuItem(
                            value: status, child: Text(status)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedStatus = value!;
                    },
                    decoration: InputDecoration(labelText: 'Status'),
                  ),
                  TextField(
                    controller: controller.notesController,
                    decoration: InputDecoration(labelText: 'Notes'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final task = {
                        "task_id": controller.uuid.v1(),
                        "task_name": controller.nameController.text,
                        "category": controller.selectedCategory,
                        "labels": controller.labelsController.text.split(','),
                        "due_date": controller.dueDateController.text,
                        "status": controller.selectedStatus,
                        "notes": controller.notesController.text,
                        // "completed_on": null,
                      };
                      String id = ID.unique();
                      controller.addTask(task, id);

                      Navigator.pop(context);
                    },
                    child: Text('Add Task'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final Map<String, dynamic> task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        leading: Icon(
          task['status'] == "completed"
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: task['status'] == "completed" ? Colors.green : Colors.grey,
        ),
        title: Text(
          task['task_name'] ?? '',
          style: TextStyle(
            decoration: task['status'] == "completed"
                ? TextDecoration.lineThrough
                : null,
            color: task['status'] == "completed" ? Colors.grey : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        // onTap: onTap,
      ),
    );
  }
}
