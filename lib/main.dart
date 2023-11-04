import 'package:e_com/Pages/HomePage.dart';
import 'package:e_com/Pages/UsersPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/Users': (context) => const UsersPAge(),
      },
    );
  }
}
