import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';
import 'dart:convert';

class AIChatbotScreen extends StatefulWidget {
  @override
  _AIChatbotScreenState createState() => _AIChatbotScreenState();
}

class _AIChatbotScreenState extends State<AIChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;

  final Map<String, String> botReplies = {
     // Greetings and Basic Queries
  "hello": "Hello farmer, I am here to assist you as an AI Vet.",
  "hi": "Hi there! How can I assist you today?",
  "how are you": "I am just a bot, but I'm here to help you!",
  "thank you": "You're welcome! Let me know if you need more help.",
  "bye": "Goodbye! Take care of your cattle and reach out anytime!",

  // Common Cattle Health Issues  
  "sick cow": "Check if the cow has a fever. Provide clean water and consult a vet if needed.",
  "my cow is coughing": "Coughing may indicate respiratory infections. Ensure proper ventilation and consult a vet if symptoms persist.",
  "cow not eating": "A loss of appetite can indicate illness. Check for fever, bloating, or infections and consult a vet.",
  "cow has diarrhea": "Diarrhea may be due to infection or diet issues. Provide clean water and electrolytes, and monitor for dehydration.",
  "cow is limping": "Check for hoof injuries, swelling, or infections. Keep the area clean and apply antiseptic if needed.",
  "signs of mastitis": "Symptoms include swelling, redness, heat in the udder, and clotted milk. Keep the udder clean and consult a vet immediately.",
  "my cow has a swollen belly": "This could be bloating. Remove the cow from rich green feed, massage the left side, and offer anti-bloat treatments.",
  "cattle heat detection": "Signs include restlessness, bellowing, mounting behavior, and mucus discharge. Proper heat detection improves breeding success.",
  
  // Nutrition & Feeding  
  "best feed for cows": "Cows thrive on fresh grass, hay, silage, and nutrient-rich supplements.",
  "how much water does a cow need?": "A cow drinks 30-50 liters of water daily, depending on size and climate. Always provide fresh and clean water.",
  "milk production is low": "Ensure a balanced diet, access to fresh water, proper rest, and stress-free milking routines.",
  "why is my cow losing weight?": "Possible causes include parasites, poor nutrition, or underlying disease. Ensure a good diet and check for signs of illness.",
  
  // Calving & Breeding  
  "cow is pregnant, what should I do?": "Ensure a nutrient-rich diet, avoid stressful activities, provide proper shelter, and monitor closely near calving time.",
  "signs of labor in cows": "Look for restlessness, discharge, contractions, and separation from the herd. Be ready to assist if needed.",
  "calf is weak after birth": "Keep the calf warm, ensure it gets colostrum within the first few hours, and monitor its health closely.",
  "how soon can I breed my cow after calving?": "Cows typically go into heat 45-60 days after calving, but waiting 60-90 days is ideal for better fertility.",
  
  // Disease Prevention & Veterinary Care  
  "cattle vaccination schedule": "Cattle should be vaccinated against diseases like anthrax, brucellosis, and foot-and-mouth disease. Consult a vet for a proper schedule.",
  "how to deworm cattle": "Cattle should be dewormed every 3-6 months using appropriate dewormers. Consult a vet for proper dosage.",
  "preventing foot rot": "Maintain clean and dry living conditions. Provide proper hoof trimming and treat early signs with antiseptic solutions.",
  "how to prevent tick infestation?": "Use tick sprays, provide regular grooming, and maintain a clean, dry environment for your cattle.",
  
  // Housing & Management  
  "best shelter for cattle": "Cows need dry, well-ventilated shelters with enough space to rest comfortably and protection from extreme weather.",
  "how much space does a cow need?": "Each cow requires at least 3-4 square meters in a barn and 20-40 square meters in an open grazing area.",
  "how to handle heat stress in cows": "Provide shade, fresh water, and avoid working cattle during peak heat hours. Sprinklers and fans help keep them cool.",
  };

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _loadChatHistory();
  }

  Future<void> _loadChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedMessages = prefs.getString('chat_history');
    if (storedMessages != null) {
      setState(() {
        _messages = List<Map<String, dynamic>>.from(jsonDecode(storedMessages));
      });
    }
  }

  Future<void> _saveChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_history', jsonEncode(_messages));
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({"text": text, "isMe": true});
    });
    _controller.clear();
    _saveChatHistory();
    _generateBotResponse(text.toLowerCase());
  }

  void _generateBotResponse(String userInput) {
    String response = botReplies[userInput] ?? "I'm not sure about that. Please consult a vet for professional advice.";
    setState(() {
      _messages.add({"text": "Typing...", "isMe": false});
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _messages.removeLast();
        _messages.add({"text": response, "isMe": false});
      });
      _saveChatHistory();
    });
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _controller.text = result.recognizedWords;
          });
        });
      }
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Vet Chatbot"),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message["isMe"] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: message["isMe"] ? Colors.green[700] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(color: message["isMe"] ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(_isListening ? Icons.mic : Icons.mic_none, color: Colors.green[700]),
                  onPressed: _isListening ? _stopListening : _startListening,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green[700]),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}