import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopicInputWidget extends StatefulWidget {
  @override
  _TopicInputWidgetState createState() => _TopicInputWidgetState();
}

class _TopicInputWidgetState extends State<TopicInputWidget> {
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _postTopic() async {
    final String topicName = _topicNameController.text;
    final String description = _descriptionController.text;

    if (topicName.isNotEmpty && description.isNotEmpty) {
      final Map<String, String> topicObject = {
        'slug': topicName,
        'description': description,
      };

      print('Posting topicObject: $topicObject');

      final Uri url = Uri.parse(
          'https://backend-project-nc-news-49l4.onrender.com/api/topics');

      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json', // Set the content-type header
          },
          body: jsonEncode(topicObject), // Encode topicObject to JSON
        );

        if (response.statusCode == 201) {
          print('Topic posted successfully!');
          // Handle success response
        } else {
          print('Failed to post topic: ${response.statusCode}');
          // Handle error response
        }
      } catch (e) {
        print('Error posting topic: $e');
        // Handle network or other errors
      }
    } else {
      print('Please fill in both topic name and description.');
      // Handle empty fields
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Topic'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _topicNameController,
              decoration: InputDecoration(
                labelText: 'Topic Name (Slug)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _postTopic,
              child: Text('Post Topic'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _topicNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
