import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
class Chat
{
  String message;
  String dateOfPost;

  Chat(this.message,this.dateOfPost);
  Map<String, dynamic> toMap()
  {
    return{'message':message, 'dateOfPost':dateOfPost};

  }

  Chat.fromMapObject(Map<String, dynamic> map) {
    this.message = map['message'];
    this.dateOfPost = map['dateOfPost'];
  }
}

class DBmanager {
  Database _database;

  Future openDb() async
  {
    if (_database == null) {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path + 'chat.db';
      _database = await openDatabase(
          path,
          version: 1, onCreate: (Database db, int version) async
      {
        await db.execute(
            "Create table chat_table(message TEXT, dateOfPost TEXT);");
      }
      );
    }
  }

  Future<int> insertChat(Chat chat) async
  {
    await openDb();
    return await _database.insert('chat_table', chat.toMap());
  }

  Future<List<Chat>> getChatList() async
  {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('chat_table');

    int count = maps.length;
    List<Chat> chatList = List<Chat>();
    for(int i = 0; i<count;i++)
      {
        chatList.add(Chat.fromMapObject(maps[i]));
      }
    return chatList;
  }
}

