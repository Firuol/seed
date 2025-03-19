import 'package:flutter/material.dart';
import '../widgets/home_widgets/top_navigation_bar.dart';
import '../widgets/home_widgets/bottom_navigation_bar.dart';
import '../widgets/home_widgets/circular_bar_summary.dart';
import '../widgets/home_widgets/toggle_tabs.dart';
import '../widgets/home_widgets/quick_option_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showRegisterAnimal = false;

  void toggleView(int tabIndex) {
    setState(() {
      showRegisterAnimal = (tabIndex == 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Welcome Back Eshetu!",
                              style: TextStyle(
                                  color: Color(0xFF14AF1B),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircularBarSummary(
                                  healthyCount: 20,
                                  atRiskCount: 3,
                                  criticalCount: 1),
                              SizedBox(height: 10),
                              ToggleTabs(
                                onTabChanged: (index) {
                                  toggleView(index);
                                },
                              ),
                              SizedBox(height: 10),
                              showRegisterAnimal
                                  ? Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Register Animal',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelText: 'Animal Type',
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              filled: true,
                                              fillColor: Color(0xFF266973)
                                                  .withOpacity(0.16),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                            items: [
                                              'Cow', 'Ox', 'Calf'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                              );
                                            }).toList(),
                                            onChanged: (value) {},
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Breed',
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              filled: true,
                                              fillColor: Color(0xFF266973)
                                                  .withOpacity(0.16),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.qr_code_scanner),
                                            label: Text('Scan QR Code'),
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Color(0xFF14AF1B),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Submit',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Color(0xFF14AF1B),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : GridView.count(
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 10,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/locator');
                                          },
                                          child: QuickOptionCard(
                                            iconPath: 'assets/location.png',
                                            label: 'Locator',
                                            backgroundColor:
                                               Color(0xFF14AF1B),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/animalList');
                                          },
                                          child: QuickOptionCard(
                                            iconPath: 'assets/herd.png',
                                            label: 'Herd Health',
                                            backgroundColor:
                                                Color(0xFF14AF1B),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/vacine');
                                          },
                                          child: QuickOptionCard(
                                            iconPath: 'assets/vaccine.png',
                                            label: 'Medication',
                                            backgroundColor:
                                                Color(0xFF14AF1B),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/telemedicine');
                                          },
                                          child: QuickOptionCard(
                                            iconPath: 'assets/phone.png',
                                            label: 'Telemedicine',
                                            backgroundColor:
                                                Color(0xFF14AF1B),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
