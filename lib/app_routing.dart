import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_managment/app_path.dart';
import 'package:task_managment/login/login_binding.dart';
import 'package:task_managment/login/login_view.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppPaths.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
