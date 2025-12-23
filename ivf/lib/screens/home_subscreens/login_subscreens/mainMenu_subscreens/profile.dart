import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ivf/assets/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
            decoration: kBackgroundBox,
            child: ValueListenableBuilder(
            valueListenable: global.isEng,
          builder: (context2, langValue, widget) {
            int value = langValue? 1 : 0 ;

            return Scaffold(
                appBar: kAppBar(h: 1.h, w: 1.w),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15.0.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              color: Colors.white.withAlpha(130),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 14.0.h,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                                    child: Card(
                                      child: ExpansionTile(
                                        title: Text(langValue?"Personal Info":"البيانات الشخصيه"),
                                        leading: Icon(FontAwesomeIcons.userEdit),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "Ahmed",
                                              decoration: InputDecoration(
                                                labelText: "Name",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "25",
                                              decoration: InputDecoration(
                                                labelText: "Age",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "01000000000",
                                              decoration: InputDecoration(
                                                labelText: "Phone",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "01000000000",
                                              decoration: InputDecoration(
                                                labelText: "Phone",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "01000000000",
                                              decoration: InputDecoration(
                                                labelText: "Phone",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: TextFormField(
                                              enabled: false,
                                              readOnly: true,
                                              initialValue: "01000000000",
                                              decoration: InputDecoration(
                                                labelText: "Phone",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Card(
                                      child: ExpansionTile(
                                        leading: Icon(FontAwesomeIcons.userMd),
                                        title: Text(langValue?"Medical Info":"البيانات الطبيه"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Card(
                                      child: ExpansionTile(
                                        leading: Icon(FontAwesomeIcons.handsHelping),
                                        title: Text(langValue?"Support":"المساعده"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Card(
                                      child: ExpansionTile(
                                        leading: Icon(FontAwesomeIcons.cogs),
                                        title: Text(langValue?"Edit Settings":"اعاده الضبط"),
                                        children: [
                                          RadioListTile(
                                            value: 1,
                                            groupValue: value,
                                            controlAffinity: ListTileControlAffinity.trailing,
                                            secondary: Icon(FontAwesomeIcons.language),
                                            onChanged: (bol) {
                                              setState(() {

                                                global.isEng.value= true;
                                              });
                                            },
                                            title: Center(child: Text("English-الانجليزيه")),
                                          ),
                                          RadioListTile(
                                            value: 0,
                                            groupValue: value,
                                            controlAffinity: ListTileControlAffinity.trailing,
                                            secondary: Icon(FontAwesomeIcons.language),
                                            onChanged: (bol) {
                                              setState(() {
                                                 //value = bol;
                                                global.isEng.value= false;
                                              });
                                            },
                                            title: Center(child: Text("Arabic-العربيه")),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  //   child: Card(
                                  //     child: ExpansionTile(
                                  //       leading: Icon(FontAwesomeIcons.language),
                                  //       title: Text("Language"),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Card(
                                      child: ExpansionTile(
                                        leading: Icon(FontAwesomeIcons.signOutAlt,color: Colors.red,),
                                        title: Text(
                                          langValue?"Sign Out":"تسجيل الخروج",
                                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 32.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2.0, color: Colors.grey)),
                          child: CircleAvatar(
                            radius: 11.h,
                            backgroundImage: AssetImage("images/profile.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            ),
          ),
        ),
      );
    });
  }
}
