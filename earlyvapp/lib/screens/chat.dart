import 'package:flutter/material.dart';

class ChatWithDoctor extends StatelessWidget {
  final String doctorName; // Doctor's name passed from the previous page

  const ChatWithDoctor({Key? key, required this.doctorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$doctorName Mariisisuuf',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF14AF1B),
      ),
      body: Column(
        children: [
          // Static chat history
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                // Doctor's message
                const ChatBubble(
                    sender: "Dr. Caalaa Bayisa",
                    message: "Nagaadha! Maal isin gargaru?"),
                // User's message
                const ChatBubble(
                    sender: "Si",
                    message: "Naguma doktor, Jabbii tokko na jalaa dhukkuba."),
                // Doctor's message
                const ChatBubble(
                    sender: "Dr. Caalaa Bayisa",
                    message: "Mallatolee akkami agarsisti?"),
                // User's message
                const ChatBubble(
                    sender: "Si",
                    message: "hin gadditi, nyaatalle homaa hin nyatu"),
                // User sending a photo
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "si",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/sick.jpg', // Replace with your photo path
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Message and file upload section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ergaa Barreessu...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.green),
                  onPressed: () {
                    // File upload logic (placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("yeroo dhihootti!"),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    // Message send logic (placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Milkainan Ergameera!"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Chat bubble widget for displaying messages
class ChatBubble extends StatelessWidget {
  final String sender;
  final String message;

  const ChatBubble({Key? key, required this.sender, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment:
            sender == "Si" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: sender == "Si" ? Colors.green[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
