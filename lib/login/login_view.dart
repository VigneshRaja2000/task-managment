import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/app_path.dart';
import 'login_controller.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

class LoginPage extends GetView<LoginController> {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: controller.passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Your password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ElevatedButton(
                onPressed: () async {
                  // Map user = {
                  //   "userId": ID.unique(),
                  //   "email": controller.emailController.text,
                  //   "password": controller.passwordController.text
                  // };
                  // await controller.signUp(user).then((val) {
                  //   print(val);
                  //   if (val['success']) {
                  //     Get.toNamed(AppPaths.tasks);
                  //   } else {
                  //     // Show Snackbar
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('User already exists'),
                  //         duration: Duration(
                  //             seconds:
                  //                 2), // Duration the Snackbar will be shown
                  //       ),
                  //     );
                  //   }
                  // });
                   Get.toNamed(AppPaths.tasks);
                },
                child: Text("Sign Up".toUpperCase()),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ));
  }
}
