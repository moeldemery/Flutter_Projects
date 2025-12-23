import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}
int rating = 3;
class _RatingScreenState extends State<RatingScreen> {
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
                appBar: kAppBar(h: 1.h, w: 1.w),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                    child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Center(
                      child: Text(
                        value ? "Rate Us" : "التقيم",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.w),
                      ),
                    ),
                    SizedBox(
                      width: 65.w,
                      height: 3.h,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            rating = 1;
                            setState(() {
                            });
                          },
                          child: Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: rating == 1 ? Colors.red[600] : Colors.grey,
                            size: rating == 1 ? 20.w : 17.w,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            rating = 2;
                            setState(() {
                            });
                          },
                          child: Icon(
                            Icons.sentiment_dissatisfied,
                            color: rating == 2 ? Colors.redAccent : Colors.grey,
                            size: rating == 2 ? 20.w : 17.w,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            rating = 3;
                            setState(() {
                            });
                          },
                          child: Icon(
                            Icons.sentiment_neutral,
                            color: rating == 3 ? Colors.amber : Colors.grey,
                            size: rating == 3 ? 20.w : 17.w,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            rating = 4;
                            setState(() {
                            });
                          },
                          child: Icon(
                            Icons.sentiment_satisfied,
                            color: rating == 4 ? Colors.lightGreen : Colors.grey,
                            size: rating == 4 ? 20.w : 17.w,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            rating = 5;
                            setState(() {
                            });
                          },
                          child: Icon(
                            Icons.sentiment_very_satisfied,
                            color: rating == 5 ? Colors.green : Colors.grey,
                            size: rating == 5 ? 20.w : 17.w,
                          ),
                        ),

                      ],
                    ),
                    // Center(
                    //   child: RatingBar.builder(
                    //     itemSize: 17.w,
                    //     initialRating: 3,
                    //     itemCount: 5,
                    //
                    //     itemBuilder: (context, index) {
                    //       switch (index) {
                    //         case 0:
                    //           return Icon(
                    //             Icons.sentiment_very_dissatisfied,
                    //             color: Colors.red,
                    //             size: 5.w,
                    //           );
                    //         case 1:
                    //           return Icon(
                    //             Icons.sentiment_dissatisfied,
                    //             color: Colors.redAccent,
                    //           );
                    //         case 2:
                    //           return Icon(
                    //             Icons.sentiment_neutral,
                    //             color: Colors.amber,
                    //           );
                    //         case 3:
                    //           return Icon(
                    //             Icons.sentiment_satisfied,
                    //             color: Colors.lightGreen,
                    //           );
                    //         case 4:
                    //           return Icon(
                    //             Icons.sentiment_very_satisfied,
                    //             color: Colors.green,
                    //           );
                    //         default:
                    //           return Container();
                    //       }
                    //     },
                    //     onRatingUpdate: (rating) {
                    //       print(rating);
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 4, //Normal textInputField will be displayed
                        maxLines: 10, // when user presses enter it will adapt to it
                        textDirection:value? TextDirection.ltr: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20.0,

                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintTextDirection:value? TextDirection.ltr:TextDirection.rtl,
                          hintText: value?"write your comment here .......":"اكتب تعليقاتك هنا",
                          //labelText: widget.labelText,
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Material(
                      elevation: 5.0,
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 150.0,
                        height: 7.0.h,
                        child: Text(
                          value ? 'Submit' : "تسجيل ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              );}
            ),
          ),
        ),
      );
    });
  }
}
