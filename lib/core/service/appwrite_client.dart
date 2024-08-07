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

  Future createTask() {
    
    Future result = AppWriteClient.database.createDocument(
      databaseId: "taskmanager",
      collectionId: '66b300520011cf176a0d',
      documentId: 'task_0001',
      data: {
        "task_id": "task_0001",
        "task_name": "Hackathon",
        "created_by": "Test User"
      },
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
