import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          const Text('You are logged in'),
          ElevatedButton(
            // onPressed: controller.logout,
            onPressed: () {},
            child: const Text('Sign in with google'),
          ),
        ],
      )),
    );
  }
}
