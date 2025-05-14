import 'package:flutter/material.dart';
import 'package:earlyvapp/screens/profile.dart';
class TopNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.04), // Responsive margin
      child: Container(
        height: screenHeight * 0.1, // Responsive height
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 12, 83, 17),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/earlyvet_logo.png',
              height: screenHeight * 0.1, // Responsive logo height
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     GestureDetector(
                  onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );},
                  child:
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01), // Added padding to top
                      child: CircleAvatar(
                        radius: screenHeight * 0.022, // Responsive avatar
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                    ),),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Eshetu Debebe',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
                GestureDetector(
                  onTap: () {},
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    child: Image.asset(
                    'assets/notification.png',
                    height: screenHeight * 0.025, // Responsive icon size
                  ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
