

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_care/assets/constants.dart';
import 'package:home_care/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:home_care/models/user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  get organisationNameController => null;
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String first = '';
  String last = '';
  String password = '';
  String phone = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
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
                          hintText: 'example@mail.com',
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: kButtonOuterPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              //autovalidate: _validateOrganisationName,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'First name cannot be empty.';
                                } else {
                                  var isOrganizationNameEmpty = false;
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() => first = val);
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
                                  FontAwesomeIcons.addressCard,
                                  color: Colors.white,
                                ),
                                hintText: 'Jack',
                                labelText: 'First Name',
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              //autovalidate: _validateOrganisationName,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Last name can not be empty.';
                                } else {
                                  var isOrganizationNameEmpty = false;
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() => last = val);
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

                                hintText: 'Spero',
                                labelText: 'Last Name',
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        //autovalidate: _validateOrganisationName,

                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Phone can not be empty.';
                          } else {
                            var isOrganizationNameEmpty = false;
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => phone = val);
                        },
                        keyboardType: TextInputType.number ,
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
                            FontAwesomeIcons.phone,
                            color: Colors.white,
                          ),
                          hintText: 'Phone ',
                          labelText: 'Phone',
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
                              '  Sign Up ',
                              style: kButtonTextS,
                            ),
                          ],
                        ),

                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth.registerEmailPw(email, password);
                            if (result == null) {
                              print("it is a null");
                              setState(() {
                                error = 'please enter a valid email';
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
