import 'package:flutter/material.dart';
import 'package:earlyvapp/screens/chat.dart'; // Import the chat page

class Telemed extends StatelessWidget {
  // Static list of doctors with their online/offline status
  final List<Map<String, dynamic>> doctors = [
    {'name': 'Dr. Tamirat Muluken', 'isOnline': true},
    {'name': 'Dr. Caalaa Damanu', 'isOnline': false},
    {'name': 'Dr. Gatbel Ankuar', 'isOnline': true},
    {'name': 'Dr. G/Egzaber G/Madin', 'isOnline': false},
    {'name': 'Dr. Caalaa Tolaa', 'isOnline': true},
    {'name': 'Dr. Kenna Waaq', 'isOnline': false},
    {'name': 'Dr. Raajii Hima', 'isOnline': true},
    {'name': 'Dr. Kebede Tilahun', 'isOnline': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Telemedicine',
          style: TextStyle(
            color: Colors.white, // Makes the text color white
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 17),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: doctor['isOnline'] ? Colors.green : Colors.grey,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              doctor['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              doctor['isOnline'] ? 'Online' : 'Offline',
              style: TextStyle(
                color: doctor['isOnline'] ? Colors.green : Colors.grey,
                fontSize: 14,
              ),
            ),
            trailing: Icon(
              Icons.circle,
              color: doctor['isOnline'] ? Colors.green : Colors.grey,
              size: 12,
            ),
            onTap: () {
              // Navigate to ChatWithDoctor page and pass doctor name
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatWithDoctor(doctorName: doctor['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
