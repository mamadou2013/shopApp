import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        dotSize: 4.0,
        autoplayDuration: Duration(milliseconds: 10000),
        dotBgColor: Colors.transparent,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
      ),
    );
  }
}
