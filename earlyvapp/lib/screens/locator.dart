import 'package:flutter/material.dart';

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
        backgroundColor:
          Color(0xFF14AF1B), // AppBar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/locationjimma.png',
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ],
      ),
    );
  }
}
