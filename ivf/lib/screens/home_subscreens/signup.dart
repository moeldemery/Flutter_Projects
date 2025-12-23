import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/model/custom_widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
//import 'package:ivf/model/mailer_model.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;
import 'package:toast/toast.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  sendMail() async {
    String username = 'diwan.demery.bot@gmail.com';
    String password = 'P@ssw0rddiwan';
    //String domainSmtp = 'mail.domain.com';

    //also use for gmail smtp
    final smtpServer = gmail(username, password);

    //user for your own domain
    //final smtpServer = SmtpServer(domainSmtp,username: username,password: password,port: 587);

    final message = Message()
      ..from = Address(username)
      ..recipients.add('mosama31@yahoo.com')
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.';
      //..html = "<h1>Shawon</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      Toast.show("The Mail have been sent ", context, duration: 4, gravity:  Toast.CENTER);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
            decoration: kBackgroundBox,
            child: ValueListenableBuilder(
            valueListenable: global.isEng,
          builder: (context2, value, widget) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                //backgroundColor: Color.fromRGBO(109, 33, 79, 1),
                body: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CircleAvatar(
                      radius: 8.0.h,
                      backgroundImage: AssetImage('images/logo.jpg'),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'SPARO',
                      style: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 30.0,
                        letterSpacing: 8.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   width: 200.0,
                    //   height: 2.0.h,
                    //   child: Divider(
                    //     color: Colors.teal.shade100,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 2.0.h,
                    // ),
                    Container(
                      height: Adaptive.h(65.0),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: EdgeInsets.all(
                        3.0.h,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.0.h,
                          ),
                          FormCard(
                            iconName: Icons.assignment_ind_rounded,
                            hint: value? 'Name' :"الاسم ",
                          ),
                          FormCard(
                            iconName: Icons.calendar_today,
                            hint: value? 'Age' :"السن ",
                          ),
                          FormCard(
                            iconName: Icons.add_call,
                            hint: value? 'Phone Number' :"الرقم ",
                          ),
                          FormCard(
                            iconName: Icons.email,
                            hint: value? 'Email' :"البريد الإلكتروني ",
                          ),
                          FormCard(
                            iconName: Icons.lock,
                            hint: value? 'Password' :"كلمه السر " ,
                          ),
                          // FormCard(
                          //   iconName: Icons.lock,
                          //   hint: 'Password',
                          // ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Material(
                              elevation: 5.0,
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () {
                                  sendMail();
                                },
                                minWidth: 150.0,
                                height: 7.0.h,
                                child: Text(
                                  value? 'SignUp' :"سجل الان ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ]),
                ),
              );}
            ),
          ),
        ),
      );
    });
  }
}
