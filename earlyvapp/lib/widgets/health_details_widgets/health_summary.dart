import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AnimalHealthWidget extends StatefulWidget {
  @override
  _AnimalHealthWidgetState createState() => _AnimalHealthWidgetState();
}

class _AnimalHealthWidgetState extends State<AnimalHealthWidget> {
  final Random _random = Random();
  late Timer _timer;

  // Real-time variables for health parameters
  double temperature = 37.5;
  int heartbeat = 110;
  String bloodPressure = '120/80';

  @override
  void initState() {
    super.initState();
    _startRealTimeUpdates();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Function to start periodic updates
  void _startRealTimeUpdates() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        // Update values in their respective ranges
        temperature = _random.nextDouble() * 3 + 35; // Range: 35°C to 42°C
        heartbeat = _random.nextInt(25) + 90; // Range: 90 bpm to 140 bpm

        // Randomize blood pressure
        int systolic = _random.nextInt(20) + 100; // Range: 100 - 160
        int diastolic = _random.nextInt(4) + 80; // Range: 80 - 90
        bloodPressure = '$systolic/$diastolic';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Animal ID: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'oxt6789',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('Status:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Color(0xFFF20000),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Critical',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/criticalCow.png',
            width: 170,
            height: 170,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHealthParameter(
                title: 'Temperature',
                iconPath: 'assets/temperature.png',
                value: '${temperature.toStringAsFixed(1)}°C',
                status: temperature > 39 ? 'High' : 'Normal',
                statusColor:
                    temperature > 39 ? Color(0xFFF20000) : Colors.green,
              ),
              _buildHealthParameter(
                title: 'Heart Beat',
                iconPath: 'assets/heart.png',
                value: '$heartbeat bpm',
                status: heartbeat > 120 ? 'High' : 'Normal',
                statusColor: heartbeat > 120 ? Color(0xFFF20000) : Colors.green,
              ),
              _buildHealthParameter(
                title: 'Blood Pressure',
                iconPath: 'assets/bp.png',
                value: bloodPressure,
                status: _isHighBP(bloodPressure) ? 'High' : 'Normal',
                statusColor:
                    _isHighBP(bloodPressure) ? Color(0xFFF20000) : Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to check for high blood pressure
  bool _isHighBP(String bp) {
    List<String> values = bp.split('/');
    int systolic = int.parse(values[0]);
    int diastolic = int.parse(values[1]);
    return systolic > 140 || diastolic > 90;
  }

  Widget _buildHealthParameter({
    required String title,
    required String iconPath,
    required String value,
    required String status,
    required Color statusColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
