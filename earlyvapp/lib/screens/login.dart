import '../screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/login_widgets/custom_input_field.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background_login.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/earlyvet_logo.png',
                  height: 200,
                ),
                SizedBox(height: 60),
                CustomInputField(
                  placeholder: 'Maqaa Tajajilama',
                ),
                SizedBox(height: 20),
                CustomInputField(
                  placeholder: 'Lakk Iciitii',
                  obscureText: true,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 12, 83, 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Ol Lixi',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    "Haaraa Galmahuf? Galmee Haaraa",
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 223, 238, 224),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
