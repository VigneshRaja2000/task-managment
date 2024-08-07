import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment/core/service/config.dart';

class LoginController extends GetxController {
  // var googleSignIn = GoogleSignIn();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(Map map) async {
    final client = Client()
        .setEndpoint(AppWriteConfig.endpoint) // Your API Endpoint
        .setSelfSigned()
        .setProject(AppWriteConfig.projectID); // Your project ID

    final account = Account(client);

    try {
      final response = await account.create(
          userId: map['userId'],
          email: map['email'],
          password: map['password']);
      return {"data": response, "success": true};
    } catch (e) {
      return {"data": null, "success": false};
    }
  }

  signIn() async {
    final client = Client()
        .setEndpoint(AppWriteConfig.endpoint) // Your API Endpoint
        .setSelfSigned()
        .setProject(AppWriteConfig.projectID); // Your project ID

    final account = Account(client);

// Go to OAuth provider login page
    try {
      var response = await account.createOAuth2Session(
          provider: OAuthProvider.google, scopes: ['profile', 'email']);
      print(response);
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
