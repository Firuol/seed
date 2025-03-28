import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen.dart';
import 'animals_list.dart';
import 'Locator.dart';
import 'telemed.dart';
import 'Vacine.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    AnimalListScreen(),
    Locator(),
    Telemed(),
    Vacine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 12, 83, 17),
        color: Colors.white, // Navbar color
        height: 60, // Navbar height
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Color.fromARGB(255, 12, 83, 17)), // Home
          Icon(Icons.list, size: 30, color: Color.fromARGB(255, 12, 83, 17)), // Cattle (Farm Animals)
          Icon(Icons.location_on, size: 30, color: Color.fromARGB(255, 12, 83, 17)), // Locator
          Icon(Icons.local_hospital, size: 30, color: Color.fromARGB(255, 12, 83, 17)), // Telemed
          Icon(Icons.vaccines, size: 30, color: Color.fromARGB(255, 12, 83, 17)), // Vaccine
        ],
        animationDuration: Duration(milliseconds: 300), // Smooth animation
        index: _pageIndex, // Keep track of the selected index
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
