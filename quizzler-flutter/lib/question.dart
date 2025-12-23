
//properties + methods

//note all classes are capitalized
class Question {

  //this is a Properties of the class
  //note all properties is starting with small etter
  String questionText;
  bool  questionAnswer;

  //constructor 1
  // Question(String q , bool a)
  // {
  //   this.questionText = q;    // this means the properties value not the function input value
  //   this.questionAnswer = a;
  // }

  //constructor 2
  //this is another way to shortcut the constructor and make it shorter
  Question(this.questionText , this.questionAnswer);


  //-- method
}

/*
* oop 4 pillars :
* --abstraction   == reduce the code chunk bites and make it readable and single function
* --encapsulation == by separating the classes and making it private and putting a methods for getting and setting new values(getters/setters)
* --inheritance   == a class can have all the previous properties and states of other class + unique things to itself using extends keyword
* --polymorphism  == by @override a method in a class and even more can do the parent method by using super.methodName() that mean both inherit and override
*
* */