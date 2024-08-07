import 'package:get/get.dart';

import 'package:task_managment/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /// Make sure to add page related controller
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
