import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
      body: GridSection(),
    );
  }
}

class GridSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveGridList(
        minSpacing: 10,
        desiredItemWidth: 150, 
        children: [
          Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Hero(
              tag: 'album-image',
              child: Image.network("https://img.ohmymag.com/article/musique/pochette-de-l-album-des-pink-floyd-dark-of-the-moon_52798d7562d1aa0907e1c57e5ed4216c397ba79e.jpg"),
            ),
          ),
        ),
        ],
      ),
    );
  }

}

class SecondPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Hero(
        tag: 'album-image',
        child: Image.network("https://img.ohmymag.com/article/musique/pochette-de-l-album-des-pink-floyd-dark-of-the-moon_52798d7562d1aa0907e1c57e5ed4216c397ba79e.jpg"),
      ),
    );
  }
}