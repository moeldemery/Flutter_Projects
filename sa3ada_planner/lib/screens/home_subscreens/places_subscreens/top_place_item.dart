
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';




class TopPlaceItem extends StatelessWidget {
  TopPlaceItem({this.placeName, this.placeImage, this.placeSubtitle});

  final String placeName;
  final String placeImage;
  final String placeSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GFCard(

        boxFit: BoxFit.cover,
        height: 200.0,

        imageOverlay: NetworkImage(placeImage),
        title: GFListTile(
          avatar: GFAvatar(child: Image.asset("assets/images/logo.png",) ,),
          title: Text(placeName,style: TextStyle(color: Colors.white , fontSize: 18.0),),
          subtitle: Text(placeSubtitle,style: TextStyle(color: Colors.white , fontSize: 15.0),),
        ),
        content: Text(
          "GFCards has three types of cards i.e, basic, with avataras and with overlay image",style: TextStyle(color: Colors.white , fontSize: 10.0),),
        buttonBar: GFButtonBar(

          children: <Widget>[
            GFButton(
              onPressed: () {},
              text: 'View',
            )
          ],
        ),
      ),

    );
  }
}
