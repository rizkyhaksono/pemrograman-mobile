import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class TempController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();

    // appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "655d60b08b8191fab5c3";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}