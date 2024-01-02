import 'package:flutter/material.dart';
import 'package:reddit_tutorial_rivaan/features/auth/screens/login_screen.dart';
import 'package:reddit_tutorial_rivaan/router.dart';
import 'package:reddit_tutorial_rivaan/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reddit Tutorial',
      theme: Pallete.darkModeAppTheme,
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => loggedOutRoute),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
