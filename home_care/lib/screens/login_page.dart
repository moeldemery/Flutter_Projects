import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';
import 'package:home_care/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:home_care/models/user.dart';

import 'loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get organisationNameController => null;

  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loading ? null :Loading(),
        StreamProvider<User>.value(
          value: AuthServices().user,
          child:  Scaffold(
            body: Container(
              decoration: kBackgroundImage,
              child: Center(
                child: Form(
                  key: _formKey,
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
                      Padding(
                        padding: kButtonOuterPadding,
                        child: TextFormField(
                          //autovalidate: _validateOrganisationName,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Email can not be empty.';
                            } else {
                              var isOrganizationNameEmpty = false;
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          readOnly: false,
                          controller: organisationNameController,
                          onTap: () {
                            //setState(() => _validateOrganisationName = true);
                          },
                          style: kTextFormFieldTextS,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                            ),
                            hintText: '012-3456789',
                            labelText: 'User Name',
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          //autovalidate: _validateOrganisationName,

                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Password cannot be empty.';
                            } else if (val.length < 6) {
                              return 'Password is too short';
                            } else {
                              var isOrganizationNameEmpty = false;
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                          readOnly: false,
                          controller: organisationNameController,
                          onTap: () {
                            //setState(() => _validateOrganisationName = true);
                          },
                          style: kTextFormFieldTextS,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'password',
                            labelText: 'Password',
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                        width: 200.0,
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red , fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: kButtonOuterPadding,
                        child: RaisedButton(
                          color: kButtonColor,
                          shape: kButtonShape,
                          padding: kButtonPadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result = await _auth.signInEmailPw(email, password);
                              setState(() {
                                loading = true;
                              });
                              if (result == null) {
                                print("it is a null");
                                setState(() {
                                  loading = false;
                                  error = 'Wronge email or password ';
                                });
                              } else {
                                print(result);
                                print(email);
                                print(password);

                                Navigator.pushNamed(context, '/login/mainMenu');

                              }
                            }
                          },
                        ),
                      ),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
