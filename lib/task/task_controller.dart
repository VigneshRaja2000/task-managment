import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/core/service/appwrite_client.dart';
import 'package:uuid/uuid.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Uuid uuid = const Uuid();
  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController labelsController = TextEditingController();
  String selectedCategory = 'personal';
  String selectedStatus = 'pending';
  List<String> categories = [
    'personal',
    'work',
    'pet care',
    'travel' 'learning'
  ];
  List<String> statuses = ['pending', 'in progress', 'completed'];
  RxList tasks = [
    {
      "task_id": "12345",
      "task_name": "Task Name",
      "updated_at": "2023-08-01T12:34:56Z",
      "created_at": "2023-07-01T12:34:56Z",
      "updated_by": "user123",
      "created_by": "user123",
      "due_date": "2023-09-01",
      "category": "personal",
      "labels": ["label1", "label2"],
      "tags": ["tag1", "tag2"],
      "status": "pending",
      "notes": "This is a sample task note.",
      "completed_on": null,
      "assignees": ["assignee1", "assignee2"],
    }
  ].obs;
  // fetchTask() async {
  //   tasks.value = await AppWriteClient.instance.fetchTasks();
  //   print(tasks);
  // }

  void addTask(task, id) async {
    tasks.add(task);
    // await AppWriteClient.instance.createTask(task, id);
    // fetchTask();
    labelsController.clear();
    nameController.clear();
    dueDateController.clear();
    notesController.clear();
  }
}
