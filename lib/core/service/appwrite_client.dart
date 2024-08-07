import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'config.dart';

class AppWriteClient {
  AppWriteClient._();

  static final instance = AppWriteClient._();

  Client client = Client()
      .setEndpoint(AppWriteConfig.endpoint)
      .setProject(AppWriteConfig.projectID);

  static final database = Databases(AppWriteClient.instance.client);

  Future createTask(task, documentId) {
    
    Future result = AppWriteClient.database.createDocument(
      databaseId: "taskmanager",
      collectionId: '66b300520011cf176a0d',
      documentId: documentId,
      data: task,
    );

    result.then((response) {
      print("success");
      print(response);
    }).catchError((error) {
      print("error");
      print(error.response);
    });

    return result;
  }
}
