

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa3ada_planner/screens/home_subscreens/giftShop_subscreens/gift_item.dart';



class GiftShopMenu extends StatefulWidget {
  @override
  _GiftShopMenuState createState() => _GiftShopMenuState();
}

class _GiftShopMenuState extends State<GiftShopMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GiftShop"),),
      body: GridView.count(
        crossAxisCount: 2,
        // shrinkWrap: true,
        childAspectRatio: 100/165,
        children: [
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
          GiftItem(
            giftName: "hii",
            giftPrice: "50 LE",
            giftImage: "https://picsum.photos/250?image=9",
          ),
        ],
      ),
    );
  }
}
