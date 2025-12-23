import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivf/assets/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ivf/assets/global.dart' as global;

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

final List<String> imgList = [
  // 'https://picsum.photos/seed/434/600',
  // 'https://picsum.photos/seed/842/600',
  // 'https://picsum.photos/seed/122/600',
  // 'https://picsum.photos/seed/327/600',
  "https://i.pinimg.com/236x/03/b6/4d/03b64de460bf9fef9a0bab7c48160a8e--discount-deals-medicine.jpg",
  "https://i.pinimg.com/564x/aa/35/07/aa350776987bbd3351c589dc90451454.jpg"
  // "https://cdn.grabon.in/gograbon/images/web-images/uploads/1618566499779/medicines-offers.jpg",
  // "https://images.freekaamaal.com/post_images/1595240047.jpg",
  // "https://medicalempire.net/wp-content/uploads/2021/02/7-E.jpg"
  // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



class _OfferScreenState extends State<OfferScreen> {
  List<String> kDemoImages = [
    'https://picsum.photos/seed/434/600',
    'https://picsum.photos/seed/842/600',
    'https://picsum.photos/seed/327/600'
  ];
  //int _selectedIndex = 0;
  //bool _loop = true;
  //InfiniteScrollController _controller;
  int _current = 0;

  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              //Image.network(item, fit: BoxFit.fill, width: 95.w),
              CachedNetworkImage(
                width: 95.w,
                fit: BoxFit.fill,
                imageUrl: item,
                placeholder: (context, url) => Center(child: SizedBox(width: 25.0 , height: 25.0,child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    ),
  )).toList();


  @override
  Widget build(BuildContext context) {
    //final pageViewController = PageController();


    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return SafeArea(
        child: MaterialApp(
          home: Container(
            decoration: kBackgroundBox,
            child: ValueListenableBuilder(
            valueListenable: global.isEng,
          builder: (context2, value, widget) {
              return Scaffold(
                appBar: kAppBar(h: 1.h ,w: 1.w) ,
                //backgroundColor: Color.fromRGBO(109, 33, 79, 1),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Text(
                          value?"Offers":"العروض",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.w),
                        ),
                      ),
                      SizedBox(
                        width: 65.w,
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      // SizedBox(
                      //   height: 50.h,
                      //   child: InfiniteCarousel.builder(
                      //       itemCount: kDemoImages.length,
                      //       itemExtent: 100.w,
                      //       loop: _loop,
                      //       controller: _controller,
                      //       axisDirection: Axis.horizontal,
                      //       onIndexChanged: (index) {
                      //         if (_selectedIndex != index) {
                      //           setState(() {
                      //             _selectedIndex = index;
                      //           });
                      //         }
                      //       },
                      //     itemBuilder: (context, itemIndex, realIndex) {
                      //       return Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             //_controller.animateToItem(realIndex+1);
                      //           },
                      //           child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(5),
                      //                 boxShadow: kElevationToShadow[2],
                      //                 image: DecorationImage(
                      //                   image: NetworkImage(kDemoImages[itemIndex]),
                      //                   fit: BoxFit.fill,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      // ),),

                      CarouselSlider(
                          items: imageSliders,

                          options: CarouselOptions(
                            height: 95.w,
                            aspectRatio: 9/16,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                  _current = index;
                                });
                              },
                          ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: _current == index ? 20.0 : 15.0,
                            height:_current == index ? 20.0 : 15.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                      // Align(
                      //   alignment: Alignment(0, 1),
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                      //     child: SmoothPageIndicator(
                      //       controller: _controller as PageController,
                      //       count: 3,
                      //       axisDirection: Axis.horizontal,
                      //       onDotClicked: (i) {
                      //         _controller.animateToItem(
                      //           i,
                      //           duration: Duration(milliseconds: 500),
                      //           curve: Curves.ease,
                      //         );
                      //       },
                      //       effect: ExpandingDotsEffect(
                      //         expansionFactor: 2,
                      //         spacing: 8,
                      //         radius: 16,
                      //         dotWidth: 16,
                      //         dotHeight: 16,
                      //         dotColor: Color(0xFF9E9E9E),
                      //         activeDotColor: Color(0xFF3F51B5),
                      //         paintStyle: PaintingStyle.fill,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );}
            ),
          ),
        ),
      );
    });
  }
}
