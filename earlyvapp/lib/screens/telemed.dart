import 'package:flutter/material.dart';
import 'package:earlyvapp/screens/chat.dart';
import 'package:earlyvapp/screens/chatbot.dart';

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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 12, 83, 17),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: doctor['isOnline'] ? Color.fromARGB(255, 12, 83, 17) : Colors.grey,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                doctor['name'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                doctor['isOnline'] ? 'Online' : 'Offline',
                style: TextStyle(
                  color: doctor['isOnline'] ? Color.fromARGB(255, 12, 83, 17) : Colors.grey,
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
                    builder: (context) => ChatWithDoctor(doctorName: doctor['name']),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the chatbot page directly
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AIChatbotScreen()),
          );
        },
        child: Icon(Icons.assistant, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 12, 83, 17),
        elevation: 4,
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  ChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isMe ? Color.fromARGB(255, 12, 83, 17) : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
