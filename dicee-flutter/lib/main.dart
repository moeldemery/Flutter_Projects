import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red[900],
        ),
        body: DicePage2(),
      ),
    ),
  );
}

class DicePage2 extends StatefulWidget {
  @override
  _DicePage2State createState() => _DicePage2State();
}

class _DicePage2State extends State<DicePage2> {
  int leftDiceValue = 1;
  int rightDiceValue = 1;

  void diceRand() {
    setState(() {
      rightDiceValue = Random().nextInt(6) + 1;
      // next int used to generate numbers from 0 to 5(written number not included)
      leftDiceValue = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: FlatButton(
                    onPressed: () {
                      print("left button pressed");
                      diceRand();
                    },
                    child: Image.asset('images/dice$leftDiceValue.png'),
                  ),
                ), //another way to put an image
              ),
              Expanded(
                flex: 1, //used to make a ratio in column
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: FlatButton(
                    onPressed: () {
                      print("right button pressed");
                      diceRand();
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceValue.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /* Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/dice1.png'),
                ), //another way to put an image
              ),
              Expanded(
                flex: 1, //used to make a ratio in column
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage('images/dice1.png'),
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
