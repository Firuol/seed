import 'package:flutter/material.dart';
import '../screens/signup.dart';
import '../screens/home_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Green Background with Logo & Curve
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: Color(0xFF14AF1B),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                                 // Logo
                    Image.asset(
                      'assets/earlyvet_logo.png',
                      height: 150,
                    ),

                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Phone Number
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: _inputDecoration('+251-'),
                  ),

                  // Password
                  SizedBox(height: 15),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: _inputDecoration('Enter your password'),
                  ),

                  // Login Button
                  SizedBox(height: 25),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text(
                        'Login',
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

                  // Signup Link
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text('Don’t have an account? Sign up'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Input Decoration
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
