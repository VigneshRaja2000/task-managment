import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: Center(
      //   child: Obx(() {
      //     return loginController.isLoggedIn.value
      //         ? Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Text('You are logged in'),
      //               ElevatedButton(
      //                 onPressed: loginController.logout,
      //                 child: const Text('Logout'),
      //               ),
      //             ],
      //           )
      //         : ElevatedButton(
      //             onPressed: loginController.login,
      //             child: const Text('Login with Google'),
      //           );
      //   }),
      // ),
    );
  }
}
