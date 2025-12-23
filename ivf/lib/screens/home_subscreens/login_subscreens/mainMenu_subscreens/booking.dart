import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/booking_subscreens/date_picker.dart';
import 'package:ivf/screens/home_subscreens/login_subscreens/mainMenu_subscreens/pastBooking_subscreens/booking_card_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class BookingDoctorScreen extends StatefulWidget {
  @override
  _BookingDoctorScreenState createState() => _BookingDoctorScreenState();
}

class _BookingDoctorScreenState extends State<BookingDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
              decoration: kBackgroundBox,
              child: Scaffold(
                appBar: kAppBar(h: 1.h, w: 1.w),
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.0.h,
                    ),
                    ValueListenableBuilder(
                        valueListenable: global.isEng,
                        builder: (context2, langValue, widget) {
                          return Center(
                            child: Text(
                              langValue ? "Appointment" : "احجز ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.w),
                            ),
                          );
                        }),
                    SizedBox(
                      width: 65.w,
                      height: 3.h,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    Container(
                      height: 65.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          DoctorCard(
                            doctorName: "Dr. Mohamed Alsaid",
                            doctorSubtitle: "Embryologist ",
                            doctorImage:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/G%C3%A9rald_KIERZEK_%28Cr%C3%A9dit_Ibo%29.jpg/220px-G%C3%A9rald_KIERZEK_%28Cr%C3%A9dit_Ibo%29.jpg",
                          ),
                          DoctorCard(
                            doctorName: "Dr.Shady Anwar",
                            doctorSubtitle: "Embryologist",
                            doctorImage:
                                "https://admin.doctors-365.de/Content/Doctors/ada6c780-7f6c-4cc0-ac99-3fdbb318bf71.jpg",
                          ),
                          DoctorCard(
                            doctorName: "Dr. Asmaa Shalah",
                          ),
                          DoctorCard(
                            doctorName: "Dr. Marwa Khalid",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
    });
  }
}

class DoctorCard extends StatefulWidget {
  @override
  _DoctorCardState createState() => _DoctorCardState();
  final String doctorName;
  final String doctorSubtitle;
  final String doctorImage;
  DoctorCard({this.doctorName, this.doctorSubtitle = "", this.doctorImage});
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 50.h,
        width: 70.w,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Column(
            children: [
              Expanded(
                //Image.network(widget.doctorImage)
                flex: 60,
                child: widget.doctorImage != null
                    ? CachedNetworkImage(
                  imageUrl: widget.doctorImage,
                  placeholder: (context, url) => Center(child: SizedBox(width: 25.0 , height: 25.0,child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ) : Image.asset('images/logo.jpg'),
              ),
              Expanded(
                flex: 40,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Center(
                        child: Text(widget.doctorName,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      subtitle: Center(
                          child:
                              Text(widget.doctorSubtitle, style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    ButtonBarTheme(
                      data: ButtonBarThemeData(),
                      child: ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ValueListenableBuilder(
                              valueListenable: global.isEng,
                              builder: (context2, value, widget) {
                                return CardButton(
                                  w: 1.2.w,
                                  iconName: Icons.edit,
                                  buttonText: value ? 'Book' : "احجز الان",
                                  iconColor: Colors.black,
                                  contextGiven: context,
                                  newScreen: DatePickerScreen(),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
