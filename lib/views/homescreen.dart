import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget phoneSection = Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                // Container(
                //   padding: const EdgeInsets.only(bottom: 32.0),
                //   child: Text('',
                //     // 'Welcome To Aurangabad City',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 23.0
                //     ),
                //   ),
                // ),
              

              ],
            ), 
          ),
        ],
      ),
    );

    Widget buttonSection1 = RaisedButton(
      child: const Text('Lets Take a Tour'),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.deepOrange,
      onPressed: () {
        Navigator.of(context).pushNamed('/screen2');
      },
    );

    Widget buttonSection2 = RaisedButton(
      child: const Text('Refer the map'),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.deepOrange,
      onPressed: () {
        Navigator.of(context).pushNamed('/mapscreen');
      },
    );

     Widget buttonSection3 = RaisedButton(
      child: const Text('Jump to Chat Room'),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
        Navigator.of(context).pushNamed('/chatroomscreen');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Aurangabad Tour Guider'),
        
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/welcome.jpg',
            width: 450.0,
            height: 450.0,
            fit: BoxFit.cover,
          ),
          phoneSection,
          buttonSection1,
          buttonSection2,
          buttonSection3,
        ],
      ),
    );
  }

  void button1(BuildContext context) {
    Navigator.of(context).pushNamed('/screen2');
  }

  void button2(BuildContext context) {
    Navigator.of(context).pushNamed('/mapscreen');
  }
  
}

