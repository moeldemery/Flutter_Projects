import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/sub_model/language_switch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  toggleCallback(val) {
    setState(() {
      val == 1 ? global.isEng.value = false : global.isEng.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
              decoration: kBackgroundBox,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                //backgroundColor: Color.fromRGBO(109, 33, 79, 1),
                body: SingleChildScrollView(
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ValueListenableBuilder(
                          valueListenable: global.isEng,
                          builder: (context2, value, widget) {
                            return AnimatedToggle(
                              scale: 0.6,
                              values: ['English', 'العربيه'],
                              initSate: value,
                              onToggleCallback: toggleCallback,
                              buttonColor: kMainColor,
                              backgroundColor: Colors.white,
                              textColor: const Color(0xFFFFFFFF),
                            );
                          }),
                    ),
                    ValueListenableBuilder(
                        valueListenable: global.isEng,
                        builder: (context2, value, widget) {
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Padding(
                              //   padding: EdgeInsets.only(left: 20.0.h, right: 25.0.h),
                              // ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Hero(
                                tag: 'logo',
                                child: CircleAvatar(
                                  radius: 10.0.h,
                                  backgroundImage: AssetImage('images/logo.jpg'),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
                                height: 3.0.h,
                                child: Divider(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              SizedBox(
                                height: 4.0.h,
                              ),
                              Text(
                                value ? 'IVF for women care portal ' : 'بوابتك ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.teal.shade100),
                              ),
                              Container(
                                height: Adaptive.h(30.0),
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                margin: EdgeInsets.all(
                                  3.0.h,
                                ),
                                child: ListView(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 3.0.h,
                                        ),
                                        Material(
                                            elevation: 5.0,
                                            color: kMainColor,
                                            borderRadius: BorderRadius.circular(30.0),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context, "/login");
                                              },
                                              minWidth: 150.0,
                                              height: 7.0.h,
                                              child: Text(
                                                value ? 'Login' : "تسجيل الدخول",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 3.0.h,
                                        ),
                                        Material(
                                            elevation: 5.0,
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30.0),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context, '/sign_up');
                                              },
                                              minWidth: 150.0,
                                              height: 7.0.h,
                                              child: Text(
                                                value ? 'Sign up' : "تسجيل لاول مره",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: kMainColor,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          );
                        }),
                  ]),
                ),
              )),
        ),
      );
    });
  }
}
