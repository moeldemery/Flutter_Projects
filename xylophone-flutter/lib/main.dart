import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded keyGeneration({Color colorButton,int soundNoteNumber}) {
    return Expanded(
      child: FlatButton(
          color: colorButton,
          onPressed: () {
            final player = AudioCache();
            //static AudioCache player = new AudioCache();
            player.play('note$soundNoteNumber.wav');
          },
          child: Text('click me dude !!!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*
              Expanded(
                child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note1.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.orange,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note2.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.yellow,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note3.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note4.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.teal,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note5.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note6.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              Expanded(
                child: FlatButton(
                    color: Colors.purple,
                    onPressed: () {
                      final player = AudioCache();
                      //static AudioCache player = new AudioCache();
                      player.play('note7.wav');
                    },
                    child: Text('click me dude !!!')),
              ),
              */
              keyGeneration(colorButton: Colors.red,soundNoteNumber: 1),
              keyGeneration(colorButton: Colors.orange,soundNoteNumber: 2),
              keyGeneration(colorButton: Colors.yellow,soundNoteNumber: 3),
              keyGeneration(colorButton: Colors.green,soundNoteNumber: 4),
              keyGeneration(colorButton: Colors.teal,soundNoteNumber: 5),
              keyGeneration(colorButton: Colors.blue,soundNoteNumber: 6),
              keyGeneration(colorButton: Colors.purple,soundNoteNumber: 7)
            ],
          ),
        ),
      ),
    );
  }
}
