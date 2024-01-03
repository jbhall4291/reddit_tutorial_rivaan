// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TopicInputWidget extends StatefulWidget {
//   @override
//   _TopicInputWidgetState createState() => _TopicInputWidgetState();
// }

// class _TopicInputWidgetState extends State<TopicInputWidget> {
//   final TextEditingController _topicNameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   Future<void> _postTopic() async {
//     final String topicName = _topicNameController.text;
//     final String description = _descriptionController.text;

//     if (topicName.isNotEmpty && description.isNotEmpty) {
//       final Map<String, String> topicObject = {
//         'slug': topicName,
//         'description': description,
//       };

//       print('Posting topicObject: $topicObject');

//       final Uri url = Uri.parse(
//           'https://backend-project-nc-news-49l4.onrender.com/api/topics');

//       try {
//         final response = await http.post(
//           url,
//           headers: {
//             'Content-Type': 'application/json', // Set the content-type header
//           },
//           body: jsonEncode(topicObject), // Encode topicObject to JSON
//         );

//         if (response.statusCode == 201) {
//           print('Topic posted successfully!');
//           // Handle success response
//         } else {
//           print('Failed to post topic: ${response.statusCode}');
//           // Handle error response
//         }
//       } catch (e) {
//         print('Error posting topic: $e');
//         // Handle network or other errors
//       }
//     } else {
//       print('Please fill in both topic name and description.');
//       // Handle empty fields
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post a Topic'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _topicNameController,
//               decoration: InputDecoration(
//                 labelText: 'Topic Name (Slug)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: _postTopic,
//               child: Text('Post Topic'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _topicNameController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }

// ---
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TopicInputWidget extends StatefulWidget {
//   @override
//   _TopicInputWidgetState createState() => _TopicInputWidgetState();
// }

// class _TopicInputWidgetState extends State<TopicInputWidget> {
//   final TextEditingController _topicNameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   List<String> _existingTopics = []; // List to store existing topics
//   String? _selectedTopic; // Currently selected topic

//   @override
//   void initState() {
//     super.initState();
//     fetchExistingTopics(); // Fetch existing topics when the widget initializes
//   }

//   Future<void> fetchExistingTopics() async {
//     final Uri url = Uri.parse(
//         'https://backend-project-nc-news-49l4.onrender.com/api/topics');

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<dynamic> topics = json.decode(response.body)['allTopics'];
//         setState(() {
//           _existingTopics = topics.map<String>((topic) => topic['slug']).toList();
//         });
//       } else {
//         print('Failed to fetch topics: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching topics: $e');
//     }
//   }

//   Future<void> _postTopic() async {
//     final String topicName = _topicNameController.text;
//     final String description = _descriptionController.text;

//     if (topicName.isNotEmpty && description.isNotEmpty) {
//       final Map<String, String> topicObject = {
//         'slug': topicName,
//         'description': description,
//       };

//       // Rest of the POST request code remains unchanged...
//     } else {
//       print('Please fill in both topic name and description.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post a Topic'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButtonFormField<String>(
//               value: _selectedTopic,
//               items: _existingTopics.map((String topic) {
//                 return DropdownMenuItem<String>(
//                   value: topic,
//                   child: Text(topic),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedTopic = newValue;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Select Existing Topic',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 24.0),
//             // Rest of the form fields (topic name, description, and button)
//             TextField(
//               controller: _topicNameController,
//               decoration: InputDecoration(
//                 labelText: 'Topic Name (Slug)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: _postTopic,
//               child: Text('Post Topic'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _topicNameController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }


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

  List<String> _existingTopics = []; // List to store existing topics
  String? _selectedTopic; // Currently selected topic
  bool _showNewTopicFields = false; // Flag to show new topic fields

  @override
  void initState() {
    super.initState();
    fetchExistingTopics(); // Fetch existing topics when the widget initializes
  }

  Future<void> fetchExistingTopics() async {
    final Uri url = Uri.parse(
        'https://backend-project-nc-news-49l4.onrender.com/api/topics');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> topics = json.decode(response.body)['allTopics'];
        setState(() {
          _existingTopics = topics.map<String>((topic) => topic['slug']).toList();
        });
      } else {
        print('Failed to fetch topics: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching topics: $e');
    }
  }

  void _toggleNewTopicFields(bool value) {
    setState(() {
      _showNewTopicFields = value;
      if (!value) {
        // Clear the text fields when hiding the new topic fields
        _topicNameController.clear();
        _descriptionController.clear();
      }
    });
  }

  Future<void> _postTopic() async {
    if (_showNewTopicFields) {
      final String topicName = _topicNameController.text;
      final String description = _descriptionController.text;

      if (topicName.isNotEmpty && description.isNotEmpty) {
        final Map<String, String> topicObject = {
          'slug': topicName,
          'description': description,
        };

        // POST request logic for the new topic...
      } else {
        print('Please fill in both topic name and description.');
      }
    } else {
      // Handle selecting an existing topic (if needed)
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
            DropdownButtonFormField<String>(
              value: _selectedTopic,
              items: [
                ..._existingTopics.map((String topic) {
                  return DropdownMenuItem<String>(
                    value: topic,
                    child: Text(topic),
                  );
                }).toList(),
                DropdownMenuItem<String>(
                  value: 'add_new_topic',
                  child: Text('Add New Topic'),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTopic = newValue;
                  if (newValue == 'add_new_topic') {
                    _toggleNewTopicFields(true);
                  } else {
                    _toggleNewTopicFields(false);
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Existing Topic / Add New Topic',
                border: OutlineInputBorder(),
              ),
            ),
            if (_showNewTopicFields)
              Column(
                children: [
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _topicNameController,
                    decoration: InputDecoration(
                      labelText: 'New Topic Name (Slug)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'New Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
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
