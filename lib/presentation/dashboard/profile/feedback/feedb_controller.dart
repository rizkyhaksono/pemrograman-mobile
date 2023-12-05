import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class FeedBController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    super.onInit();

    // Appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65170f0fcb5e6df99981";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
