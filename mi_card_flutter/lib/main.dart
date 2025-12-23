import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //this is used as an invisible container container
                //where its width is infinity so it can be used to align the children of column to the left
                width: double.infinity,
                height: 30.0,
              ),
              CircleAvatar(
                //backgroundColor: Colors.red,
                backgroundImage: AssetImage('image/me.jpg'),
                radius: 75.0,
              ),
              Text(
                'Mohamed Ossama ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'Flutter Trainee ',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 25.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'Pacifico'
                ),
              ),
              SizedBox(
                height: 25.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[900],
                ),
              ),
              Container(
                //this is used as an invisible container container
                //where its width is infinity so it can be used to align the children of column to the left
                width: double.infinity,
                height: 30.0,
              ),
              Card(
                //padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        //Icons.add_call,
                        Icons.phone,
                        size: 30.0,
                        color: Colors.red.shade800,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '(+2)0128-133-5505',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                //padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    //Icons.add_call,
                    Icons.email,
                    size: 30.0,
                    color: Colors.red.shade800,
                  ),
                  title: Text(
                    'mosama31@yahoo.com',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
