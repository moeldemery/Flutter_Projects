import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundImage,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: kLogoImage,
              ),
              SizedBox(
                height: 75.0,
                width: 200.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: kButtonOuterPadding,
                    child: RaisedButton(
                      color: kButtonColor,
                      shape: kButtonShape,
                      padding: kButtonPadding,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.signInAlt,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            '  Login ',
                            style: kButtonTextS,
                          ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      },
                    ),

                  ),
                  Padding(
                    padding: kButtonOuterPadding,
                    child: RaisedButton(
                      color: kButtonColor,
                      shape: kButtonShape,
                      padding: kButtonPadding,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.userPlus,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          Text(
                            '  Sign up',
                            style: kButtonTextS,
                          ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/register');
                      },
                    ),

                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
                width: 200.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                ),
              ),
              Padding(
                padding: kButtonOuterPadding,
                child: RaisedButton(
                  color: kButtonFaceBookColor,
                  shape: kButtonShape,
                  padding:kButtonPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      Text(
                        '  Login using Facebook',
                        style: kButtonTextS,
                      ),
                    ],
                  ),
                  onPressed: (){},
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: kButtonGoogleColor,
                  shape: kButtonShape,
                  padding:kButtonPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      Text(
                        '  Login using Google',
                        style: kButtonTextS,
                      ),
                    ],
                  ),
                  onPressed: (){},
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
