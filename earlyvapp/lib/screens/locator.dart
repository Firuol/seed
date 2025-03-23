import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Import the webview_flutter package

class Locator extends StatelessWidget {
  const Locator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locator Page',
          style: TextStyle(
            color: Colors.white, // Makes the text color white
          ),
        ), // Title of the AppBar
        backgroundColor: const Color(0xFF14AF1B), // AppBar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: WebView( // Remove the 'const' keyword
        initialUrl: 'assets/map.html', // Load the Leaflet map
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
      ),
    );
  }
}