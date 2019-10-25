import 'package:flutter/material.dart';
import 'dbmanager.dart';
import 'package:intl/intl.dart';

//void main() => runApp(MyApp());

class ChatScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
{
  DBmanager dbmanager = new DBmanager();
  final _messagecontroller = TextEditingController();
  Chat chat;
  final _formkey = new GlobalKey<FormState>();
  List<Chat> chatList;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Chat application'),),
      body: ListView(children: <Widget> [
        Form(key:_formkey,
        child:Column(
          children: <Widget> [
            TextFormField(
              decoration: new InputDecoration(labelText:'Post message here'),
              controller: _messagecontroller,
              validator: (val) => val.isNotEmpty? null:'Message field cannot be empty',
                ),
            RaisedButton(
              child:Text('Submit'),
              onPressed: () {
                _submitChat(context);
              },
             ),
            FutureBuilder<List<Chat>>(
              future:dbmanager.getChatList(),
              builder:(context,snapshot)
                {
                  if(snapshot.hasError)
                    {
                      debugPrint("++++++++ERROR++++++++");
                    }
                  if(snapshot.hasData)
                    {
                      chatList = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: chatList == null? 0:chatList.length,
                        itemBuilder:(context,int index)
                          {
                            Chat chat1 = chatList[index];
                            debugPrint(chat1.message);
                            return Card(
                              child:ListTile(
                                title: Text(chat1.message),
                                subtitle: Text(chat1.dateOfPost),
                              ),

                            );

                          }
                      );
                    }
                  return new CircularProgressIndicator();
                }
            )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitChat(BuildContext context) async
  {
    if(_formkey.currentState.validate())
      {
        if(chat == null)
          {
            String dateTime1 = DateFormat.yMMMd().format(DateTime.now());
            Chat chat = new Chat(_messagecontroller.text,dateTime1);
            _messagecontroller.clear();
            int test = await dbmanager.insertChat(chat);
            if(test == 1)
              {
                debugPrint("Chat has been added to Database");
              }
          }
      }
  }
}
