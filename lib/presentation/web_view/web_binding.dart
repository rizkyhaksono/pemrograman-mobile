import 'package:demo_mobile/presentation/web_view/web_controller.dart';
import 'package:get/get.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebController>(() => WebController());
  }
}
