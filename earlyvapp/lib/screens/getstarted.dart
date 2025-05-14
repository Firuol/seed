import 'package:flutter/material.dart';
import 'login.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Farmer image in a circular frame with green background
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none, // Allow overflow
              children: [
                // Green background circle
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color.fromARGB(255, 12, 83, 17), // Green background for the circle
                  ),
                ),
                // Farmer image (slightly larger than the circle and positioned above)
                Positioned(
                  top: -50, // Move the image upward to overflow above the circle
                  child: ClipOval(
                    child: Image.asset(
                      'assets/farmer1.png', // Replace with your image path
                      width: 320, // Slightly larger than the circle
                      height: 350, // Slightly larger than the circle
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/startlogo.png', // Replace with your logo path
              width: 250,
              height: 150,
            ),
Text(
                      'Your herd, your control',
                      style: TextStyle(fontSize: 16, color: Color(0xFF14AF1B)),
                    ),
            SizedBox(height: 100), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                backgroundColor: Color.fromARGB(255, 12, 83, 17), // Button color using #14AF1B
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}