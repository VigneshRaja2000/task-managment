import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:get/get.dart';
import 'package:task_managment/core/service/config.dart';

class LoginController extends GetxController {
  // var googleSignIn = GoogleSignIn();
  signIn() async {
    final client = Client()
        .setEndpoint(AppWriteConfig.endpoint) // Your API Endpoint
        .setProject(AppWriteConfig.projectID); // Your project ID

    final account = Account(client);

// Go to OAuth provider login page
    await account.createOAuth2Session(
        provider: OAuthProvider.google, scopes: ['profile', 'email']);
  }
}
