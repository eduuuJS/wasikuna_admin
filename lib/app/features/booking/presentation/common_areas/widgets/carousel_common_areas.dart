import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselCommonAreas extends StatefulWidget {
  const CarouselCommonAreas(
      {Key? key, required this.imageList, required this.height})
      : super(key: key);
  final List<String> imageList;
  final double height;

  @override
  CarouselCommonAreasState createState() => CarouselCommonAreasState();
}

class CarouselCommonAreasState extends State<CarouselCommonAreas> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        items: widget.imageList.map(
          (item) {
            return Image.network(
              width: MediaQuery.of(context).size.width,
              item,
              fit: BoxFit.fill,
            );
          },
        ).toList(),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: DotsIndicator(
          dotsCount: widget.imageList.length,
          position: _current,
        ),
      )
    ]);
  }
}
