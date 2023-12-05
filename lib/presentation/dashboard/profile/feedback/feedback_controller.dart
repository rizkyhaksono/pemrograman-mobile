import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var comment = ''.obs;

  void submitFeedback() {
    // Implement your logic to handle the feedback (e.g., send it to a server)
    print(
        'Name: ${name.value}, Email: ${email.value}, Comment: ${comment.value}');
  }
}
