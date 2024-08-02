import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
