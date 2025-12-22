import 'package:bmi_calculator/components/background_card.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.bmiResultIntreputation,@required this.bmiResultText});

  final String bmiResult;
  final String bmiResultText;
  final String bmiResultIntreputation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results....'),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0) ,
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCardBackground(
              colour: kCardInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResultText.toUpperCase(),
                    style: kLabelResultTextStyle,

                  ),
                  Text(
                    bmiResult,
                    style: kLabelResultStyle,
                  ),
                  Text(
                    bmiResultIntreputation,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },

            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,


              child: Text(
                'Re-Calculate',
                style: kButtonText ,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
