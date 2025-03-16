import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/login.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green Background with Curved Shape
            ClipPath(
              clipper: HeaderClipper(), // Custom clipper for smooth curve
              child: Container(
                width: double.infinity,
                height: 250, // Adjusted height
                decoration: BoxDecoration(
                  color: Color(0xFF14AF1B), // Green color
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40), // Spacing for status bar
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Please Sign up to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Input Fields Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name
                  SizedBox(height: 20),
                  Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Input Text Here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                    ),
                  ),

                  // Phone Number/Email
                  SizedBox(height: 15),
                  Text(
                    'Phone number/Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9),
                    ],
                    decoration: InputDecoration(
                      hintText: '+251-',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                    ),
                  ),

                  // National ID
                  SizedBox(height: 15),
                  Text(
                    'National ID',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Fayda Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                    ),
                  ),

                  // Sign Up Button
                  SizedBox(height: 25),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                        backgroundColor: Color(0xFF14AF1B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for Header Curve
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8); 
    path.quadraticBezierTo(size.width / 2, size.height + 30, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
