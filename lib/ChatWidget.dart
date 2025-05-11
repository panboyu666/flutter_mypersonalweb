import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  Future<void> _sendMessage(String message) async {
    if (message.isEmpty) return;

    setState(() {
      _messages.add({"user": message});
    });

    final response = await _callAPI(message);

    if (response != null) {
      setState(() {
        _messages.add({"ai": response});
      });
    }
  }

  Future<String?> _callAPI(String userMessage) async {
    final url = 'https://api.openai.com/v1/completions';
    final apiKey = 'your-api-key'; // 用您自己的 API 密鑰

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = json.encode({
      'model': 'text-davinci-003',
      'prompt': userMessage,
      'max_tokens': 150,
      'temperature': 0.7,
    });

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['text'].trim(); // AI 回應
    } else {
      print('API 請求失敗');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900], // 設定背景顏色
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message.containsKey("user");
                return ListTile(
                  title: Text(
                    message.values.first,
                    style: TextStyle(
                      color: isUserMessage ? Colors.blue : Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: isUserMessage
                      ? null
                      : Text(
                    'AI',
                    style: TextStyle(color: Colors.green, fontSize: 12),
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
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '輸入你的訊息...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (text) {
                      _sendMessage(text);
                      _controller.clear();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                    _controller.clear();
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
