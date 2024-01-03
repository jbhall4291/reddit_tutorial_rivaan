import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:routemaster/routemaster.dart';

class Item {
  final String slug;

  Item({
    required this.slug,
  });
}

Future<List<Item>> fetchItems() async {
  final response = await http.get(
    Uri.parse('https://backend-project-nc-news-49l4.onrender.com/api/topics'),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> topicsData = data['allTopics'];

    List<Item> items = topicsData
        .map((item) => Item(
              slug: item['slug'],
            ))
        .toList();

    return items;
  } else {
    throw Exception('Failed to load items');
  }
}

class CommunityListDrawer extends StatefulWidget {
  const CommunityListDrawer({Key? key}) : super(key: key);

  @override
  _CommunityListDrawerState createState() => _CommunityListDrawerState();
}

class _CommunityListDrawerState extends State<CommunityListDrawer> {
  late Future<List<Item>> futureItems;

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Create a community'),
              leading: Icon(Icons.add),
              onTap: () => navigateToCreateCommunity(context),
            ),
            Expanded(
              child: FutureBuilder<List<Item>>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No items found.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].slug),
                          // Add more fields as needed
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
