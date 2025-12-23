
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class GiftItem extends StatelessWidget {

  GiftItem({this.giftName, this.giftImage, this.giftPrice});

  final String giftName;
  final String giftImage;
  final String giftPrice;

  @override
  Widget build(BuildContext context) {
    return GFCard(

      boxFit: BoxFit.cover,
      height: 300.0,

      padding: const EdgeInsets.all(4),
      color: Colors.white10,

      image: Image.network(giftImage),
      title: GFListTile(

        title: Text(giftName),
        subtitle: Text(giftPrice),

      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () {},
            text: 'Add to Cart',
          ),

        ],
      ),
    );
  }
}
