import 'package:flutter/material.dart';
import 'package:reddit_tutorial_rivaan/features/auth/screens/login_screen.dart';
import 'package:reddit_tutorial_rivaan/features/community/screens/create_community_screen.dart';
import 'package:reddit_tutorial_rivaan/features/home/screens/home_screen.dart';

import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-community': (_) => MaterialPage(child: TopicInputWidget()),
});
