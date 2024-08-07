import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/app_path.dart';

import 'package:task_managment/app_routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPaths.login,
      getPages: AppPages.routes,
    );
  }
}
