import 'package:flutter/material.dart';

class ChatWithDoctor extends StatelessWidget {
  final String doctorName; // Vet's name passed from the previous page

  const ChatWithDoctor({Key? key, required this.doctorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with $doctorName',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 83, 17),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Call functionality (placeholder)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Calling...")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.video_call, color: Colors.white),
            onPressed: () {
              // Video call functionality (placeholder)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Starting video call...")),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Static chat history
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                // Vet's message
                const ChatBubble(
                    sender: "Dr. Caalaa Bayisa",
                    message: "Hello! How can I assist your calf?"),
                // User's message
                const ChatBubble(
                    sender: "You",
                    message: "Hi, doctor. My calf is not feeling well."),
                // Vet's message
                const ChatBubble(
                    sender: "Dr. Caalaa Bayisa",
                    message: "What symptoms is your calf showing?"),
                // User's message
                const ChatBubble(
                    sender: "You",
                    message: "It seems very weak and has lost its appetite."),
                // User sending a photo
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "You",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/sick.jpg', // Replace with your calf's photo path
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
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Color.fromARGB(255, 12, 83, 17)),
                  onPressed: () {
                    // File upload logic (placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Coming soon!"),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color.fromARGB(255, 12, 83, 17)),
                  onPressed: () {
                    // Message send logic (placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Message sent successfully!"),
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
            sender == "You" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: sender == "You" ? Colors.green[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
