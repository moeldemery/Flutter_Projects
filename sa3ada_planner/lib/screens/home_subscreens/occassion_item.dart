import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///home/m/AndroidStudioProjects/sa3ada_planner/old/constants.dart';

class OccasionItem extends StatefulWidget {
  final String occasionImage ;
  final String occasionName ;
  OccasionItem({this.occasionName, this.occasionImage});

  @override
  _OccasionItemState createState() => _OccasionItemState();
}

class _OccasionItemState extends State<OccasionItem> {

  

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                child: Card(
                    color: Colors.blue[300],
                    shadowColor: Colors.grey,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              //image

                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: Image.asset(
                                widget.occasionImage,
                                fit: BoxFit.cover,
                                height: 100,
                              )),
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Text(widget.occasionName, style: kIconButtonMapTextS),
                      ],
                    )),
              ),
            ),
          ),
        ],
      );
  }
}
