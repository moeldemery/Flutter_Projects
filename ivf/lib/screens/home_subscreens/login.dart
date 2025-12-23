import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/model/form_bloc.dart';
import 'package:ivf/model/form_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = FormProvider.of(context);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        home: Container(
          decoration: kBackgroundBox,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            //backgroundColor: Color.fromRGBO(109, 33, 79, 1),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.5.h),
                      child: Hero(
                        tag: 'logo',
                        child: CircleAvatar(
                          radius: 12.0.h,
                          backgroundImage: AssetImage('images/logo.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'SPARROW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        letterSpacing: 8.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "KashieMercy",
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 2.0.h,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Container(
                        height: Adaptive.h(50.0),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: EdgeInsets.all(
                          3.0.h,
                        ),
                        child: Column(children: [
                          _emailField(formBloc),
                          _passwordField(formBloc),
                          // _checkbox(),
                          _button(formBloc, context),
                          _buttonBack(),
                          // _forgotPasswordButton(context),
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _emailField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.h),
            child: Container(
              child: ValueListenableBuilder(
                  valueListenable: global.isEng,
                  builder: (context2, value, widget) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.h, 0.5.h, 0, 0.5.h),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.keyboard, color: kMainColor),
                              hintText: 'you@example.com',
                              labelText: value ? 'Email' : "البريد الإلكتروني ",
                              errorText: snapshot.error,
                            ),
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontSize: 20.0,
                            ),
                            onChanged: formBloc.changeEmail,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          );
        });
  }

  Widget _passwordField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.h),
            child: Container(
              child: ValueListenableBuilder(
                  valueListenable: global.isEng,
                  builder: (context2, value, widget) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.h, 0.5.h, 0, 0.5.h),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            //maxLength: 20,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.lock, color: kMainColor),
                              hintText: 'Password',
                              labelText: value ? 'Password' : "كلمه السر ",
                              errorText: snapshot.error,
                            ),
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontSize: 20.0,
                            ),
                            onChanged: formBloc.changePassword,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          );
        });
  }

  // Widget _checkbox() {
  //   return Row(
  //     children: <Widget>[
  //       Checkbox(
  //         onChanged: (checked) => this.setState(() => isChecked = !isChecked),
  //         value: this.isChecked,
  //       ),
  //       Text('keep me logged in'),
  //     ],
  //   );
  // }

  Widget _button(FormBloc formBloc, BuildContext contexts) {
    return StreamBuilder<bool>(
        stream: formBloc.submitValidForm,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            child: ValueListenableBuilder(
                valueListenable: global.isEng,
                builder: (context2, value, widget) {
                  return Material(
                    elevation: 5.0,
                    color:kMainColor,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(contexts, '/login/menu');
                      },
                      minWidth: 150.0,
                      height: 7.0.h,
                      child: Text(
                        value ? 'Login' : "تسجيل الدخول ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }

  Widget _buttonBack() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: ValueListenableBuilder(
          valueListenable: global.isEng,
          builder: (context2, value, widget) {
            return Material(
              elevation: 5.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minWidth: 150.0,
                height: 7.0.h,
                child: Text(
                  value ? 'Back' : "العوده ",
                  style: TextStyle(
                    fontSize: 18,
                    color: kMainColor,
                  ),
                ),
              ),
            );
          }),
    );
  }

  // Widget _forgotPasswordButton(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () => Navigator.pushNamed(context, '/forgot_password'),
  //         child: Container(
  //           child: Text('Forgot password?'),
  //           alignment: Alignment.bottomLeft,
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () => Navigator.pushNamed(context, '/sign_up'),
  //         child: Container(
  //           child: Text('Sign up'),
  //           alignment: Alignment.bottomLeft,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
