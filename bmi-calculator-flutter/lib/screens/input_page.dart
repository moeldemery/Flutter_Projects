import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_card.dart';
import '../components/background_card.dart';
import '../components/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kCardInactiveColor;
  Color femaleCardColor = kCardInactiveColor;

  void updateGender(GenderType gender) {
    /*if(gender ==GenderType.male)
      {
        if(maleCardColor==cardInactiveColor )
          {
            maleCardColor=cardActiveColor;
            femaleCardColor=cardInactiveColor;
          }
      }
    else if(gender ==GenderType.female){
      if(femaleCardColor==cardInactiveColor )
      {
        femaleCardColor=cardActiveColor;
        maleCardColor=cardInactiveColor;
      }
    }*/
    //using ternary operations
    maleCardColor =
        (gender == GenderType.male) ? kCardActiveColor : kCardInactiveColor;
    femaleCardColor =
        (gender == GenderType.female) ? kCardActiveColor : kCardInactiveColor;
  }

  int heightValue = 180;
  int weightValue = 60;
  int ageValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardBackground(
                    onPress: () {
                      setState(() {
                        updateGender(GenderType.male);
                      });
                    },
                    colour: maleCardColor,
                    cardChild: GenderCard(
                      iconChild: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardBackground(
                    colour: femaleCardColor,
                    onPress: () {
                      setState(() {
                        updateGender(GenderType.female);
                      });
                    },
                    cardChild: GenderCard(
                      iconChild: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: ReusableCardBackground(
              colour: kCardActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightValue.toString(),
                        style: kLabelBigText,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: kBottomContainerColor,
                      thumbColor: Colors.green,
                      overlayColor: Color(0x55EB1555),
                      inactiveTrackColor: kTextColor,
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 200.0,
                      value: heightValue.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          heightValue = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardBackground(
                    colour: kCardActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kLabelBigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            CircleIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardBackground(
                    colour: kCardActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          ageValue.toString(),
                          style: kLabelBigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  ageValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            CircleIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: heightValue,
                weight: weightValue,
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            bmiResultText: calc.getResult(),
                            bmiResultIntreputation: calc.getIntreputation(),
                          )));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text(
                  'Calculate',
                  style: kButtonText,

                  //textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
* this is a custom made widget for a circular button ook like the floating button with
* your own styling
* */
class CircleIconButton extends StatelessWidget {
  @override
  CircleIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPress,
      shape: CircleBorder(),
      padding: EdgeInsets.all(10.0),
      fillColor: Colors.grey,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      elevation: 6.0,
      disabledElevation: 6.0,
    );
  }
}
