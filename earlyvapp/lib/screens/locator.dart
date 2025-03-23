import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io'; // Import to check platform

class Locator extends StatefulWidget {
  const Locator({Key? key}) : super(key: key);

  @override
  _LocatorState createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    // Load the local file for Mobile (Android & iOS)
    if (!Platform.isAndroid && !Platform.isIOS) {
      controller.loadRequest(Uri.parse("assets/map.html"));
    } else {
      controller.loadFlutterAsset("assets/map.html");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locator Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF14AF1B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
