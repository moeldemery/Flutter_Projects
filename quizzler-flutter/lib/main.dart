import 'package:flutter/material.dart';
//import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
       appBar: AppBar(
          backgroundColor: Colors.grey.shade600,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=>Scaffold.of(context).openDrawer(),
          ),
          title: Text("من صيربح المليون"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  'main menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              /*ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),*/
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper=[];
  // List<String> quizQuestions=[
  //   'You can lead a cow down stairs but not up stairs.' ,
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> quizAnswers=[
  //   false,
  //   true,
  //   true
  // ];
  //
  // Question quest =  Question(q: 'You can lead a cow down stairs but not up stairs.',a:false );



  void checkAnswer(bool input)
  {
    bool correctAnswer= quizBrain.getQuestionAnswer();
    setState(() {
      if(correctAnswer == input)
      {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color:Colors.green,
          ),
        );

      }
      else
      {
        scoreKeeper.add(
          Icon(
            Icons.remove_circle_outline,
            color:Colors.red,
          ),
        );
      }
      bool done=quizBrain.nextQuestion();
      if(done == true){
        Alert(context: context, title: "Congratulation", desc: "You are awesome.").show();
        scoreKeeper.clear();
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizQuestions[questionCounter],
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);

              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,

        ),
      ],
    );
  }
}

