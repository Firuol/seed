import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF14AF1B)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Picture
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/user.png"), // Replace with actual image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF14AF1B),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white, size: 18),
                        onPressed: () {
                          // Add edit profile picture functionality
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // User Information
              _buildProfileCard(Icons.person, "Name", "Eshetu Debebe", screenWidth),
              _buildProfileCard(Icons.phone, "Phone", "+251 934 567 890", screenWidth),
              _buildProfileCard(Icons.pets, "Total Herd", "20 Cattle", screenWidth),

              SizedBox(height: 30),

              // Edit Profile Button
              _buildButton(context, Icons.edit, "Edit Profile", Color(0xFF14AF1B), () {
                // Navigate to edit profile screen
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(IconData icon, String title, String value, double screenWidth) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF14AF1B), size: 28),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.black54, fontSize: 14)),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String text, Color color, Function onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => onTap(),
        icon: Icon(icon, size: 20),
        label: Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
