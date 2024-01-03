import 'package:flutter/material.dart';
import 'package:reddit_tutorial_rivaan/core/constants/constants.dart';
import 'package:reddit_tutorial_rivaan/features/home/drawers/community_list_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: const Text('JH'),
            ),
          )
        ],
      ),
      drawer: const CommunityListDrawer(),
      body: const Text('hello from home page'),
    );
  }
}
