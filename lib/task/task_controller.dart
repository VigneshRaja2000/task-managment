// task_controller.dart
import 'package:get/get.dart';

class TaskController extends GetxController {
  var tasks = [].obs;

  void fetchTasks() {
    // Here you would typically fetch tasks from an API or database
    // For now, we'll add some dummy tasks
    tasks.value = [];
  }

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }
}
