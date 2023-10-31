import 'package:demo_mobile/presentation/web_view/web_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends GetView<WebController> {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.color.background,
        title: const Text("Github"),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller.githubRizky,
      ),
    );
  }
}
