
import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.weight, this.height});
  final int weight;
  final int height;

  double _bmiValue; //private variable canot be accessed from other classes so we use a getter
  String calculateBMI()
  {
    _bmiValue= weight / pow(height/100, 2);
    return _bmiValue.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmiValue >= 25)
      {
        return 'OverWeight';
      }
    else if(_bmiValue >18.5)
      {
        return 'Normal';
      }
    else
      {
        return'Underweight';
      }
  }

  String getIntreputation()
  {
    if(_bmiValue >= 25)
    {
      return 'play more sports MR Fatty';
    }
    else if(_bmiValue >18.5)
    {
      return 'everyone envy the healthy Person';
    }
    else
    {
      return'do you have a fridge? go eat more';
    }
  }
}