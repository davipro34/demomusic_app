import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Music Demo',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Image.network("https://img.ohmymag.com/article/musique/pochette-de-l-album-des-pink-floyd-dark-of-the-moon_52798d7562d1aa0907e1c57e5ed4216c397ba79e.jpg"),
        ),
      ),
    );
  }
}