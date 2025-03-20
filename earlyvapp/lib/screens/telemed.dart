import 'package:flutter/material.dart';
import 'package:earlyvapp/screens/chat.dart';
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
        backgroundColor: Color(0xFF14AF1B),
        elevation: 0,
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
          // Show the AI Chatbot dialog
          showDialog(
            context: context,
            builder: (context) => AIChatbotDialog(),
          );
        },
        child: Icon(Icons.assistant, color: Colors.white),
        backgroundColor: Color(0xFF14AF1B),
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
          color: isMe ? Color(0xFF14AF1B) : Colors.grey[200],
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

class AIChatbotDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF14AF1B),
              child: Icon(Icons.assistant, color: Colors.white, size: 30),
            ),
            SizedBox(height: 16),
            Text(
              "AI Assistant",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "How can I assist you today?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Type your question...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle AI assistant response
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF14AF1B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}