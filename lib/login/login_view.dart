import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/app_path.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            // onPressed: controller.logout,
            onPressed: () {
              controller.signIn();
              // Get.toNamed(AppPaths.tasks);
            },
            child: const Text('Sign in with google'),
          ),
        ],
      )),
    );
  }
}
