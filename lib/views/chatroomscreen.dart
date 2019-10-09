import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'chat_view.dart';


// void main() => runApp(new ChatScreen());

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: "Group Notification",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: new Chat(),
    );
  }
}
