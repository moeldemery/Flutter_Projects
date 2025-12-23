

import 'package:flutter/material.dart';

const Decoration kBackgroundBox = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5, 0.7, 0.95],
    colors: [
      Color.fromRGBO(137, 51, 122, 1),
      Color.fromRGBO(139, 53, 124, 1),
      Color.fromRGBO(112, 27, 94, 1),
      Color.fromRGBO(36, 0, 22, 1),
    ],
  ),
);


 AppBar kAppBar({double h, double w}) {
   return AppBar(
     backgroundColor: Colors.transparent,
     centerTitle: true,
     toolbarHeight: 10 * h,
     title: Row(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Hero(
           tag: 'logo',
           child: CircleAvatar(
             radius: 4 * h,
             backgroundImage: AssetImage('images/logo.jpg'),
           ),
         ),

         SizedBox(
           width: 5 * w,

         ),
         Text(
           'SPARROW',
           style: TextStyle(
             color: Colors.teal.shade100,
             fontSize: 20.0,
             letterSpacing: 8.5,
             fontWeight: FontWeight.bold,
             fontFamily: "KashieMercy",
           ),
         ),
       ],
     ),
   );
 }


AppBar kAppBarProfile({double h, double w}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    toolbarHeight: 30 * h,
    title: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'logo',
          child: CircleAvatar(
            radius: 13 * h,
            backgroundImage: AssetImage('images/logo.jpg'),
          ),
        ),
        //
        // SizedBox(
        //   height: 5 * h,
        //
        // ),
        // Text(
        //   'SPARROW',
        //   style: TextStyle(
        //     color: Colors.teal.shade100,
        //     fontSize: 20.0,
        //     letterSpacing: 8.5,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: "KashieMercy",
        //   ),
        // ),
      ],
    ),
  );
}


final Color kMainColor = Color.fromRGBO(181, 7, 107, 1);
final Color kMainColorGradient = Colors.purple[300];