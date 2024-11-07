import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("CustomerSupportScreen initialized");
    // Adding an initial bot message
    _addBotMessage(
      "Hey! I'm Hazell Chat Bot! Ask me anything or select an option below.",
      options: [
        "Get free training",
        "Get Started free",
        "Chat with the sales team"
      ],
    );
  }

  void _addUserMessage(String message) {
    if (message.trim().isEmpty) return;

    print("User message added: $message");

    setState(() {
      messages.add({"sender": "user", "text": message});
      messageController.clear();
    });

    // Simulate bot response after delay
    Future.delayed(Duration(seconds: 1), () {
      print("Bot response triggered");
      _addBotMessage("Got you, please wait to connect with an agent.");
    });
  }

  void _addBotMessage(String message, {List<String>? options}) {
    setState(() {
      messages.add({"sender": "bot", "text": message, "options": options});
    });
    print("Bot message added: $message");
  }

  void _handleOptionTap(String option) {
    print("Option tapped: $option");
    _addUserMessage(option);
  }

  @override
  Widget build(BuildContext context) {
    print("Building CustomerSupportScreen");

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message["sender"] == "user";

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: isUser
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (message["options"] == null)
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Colors.greenAccent[100]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message["text"],
                            style: TextStyle(
                              color: isUser ? Colors.black : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      if (message["options"] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                message["text"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              children: (message["options"] as List<String>)
                                  .map((option) {
                                return ElevatedButton(
                                  onPressed: () => _handleOptionTap(option),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.blueAccent,
                                    backgroundColor: Colors.white,
                                    side: BorderSide(color: Colors.blueAccent),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(option),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    print("Send button pressed");
                    _addUserMessage(messageController.text);
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
