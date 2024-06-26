import 'package:flutter/material.dart';
import 'music.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicPlayer(),
    );
  }
}