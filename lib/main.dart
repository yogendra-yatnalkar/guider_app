import 'package:flutter/material.dart';
import 'views/homescreen.dart';
import 'views/screen2.dart';
import 'views/mapscreen.dart';
import 'views/chatroomscreen.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      title: 'ATG',
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/screen2': (BuildContext context) => new Screen2(),
        '/mapscreen':(BuildContext context) => new MapScreen(),
        '/chatroomscreen': (BuildContext context) => new ChatScreen(),
      },
    );
  }
}





