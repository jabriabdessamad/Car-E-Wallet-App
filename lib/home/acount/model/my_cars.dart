import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/home/acount/model/car.dart';

var currentCar = carList.cars![0];

class MyCars extends StatelessWidget {
  const MyCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 25),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: LayoutStarts(),
    );
  }
}

class LayoutStarts extends StatelessWidget {
  const LayoutStarts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarDetailsAnimation(),
        CustomBottomSheet(),
      ],
    );
  }
}

class CarDetailsAnimation extends StatefulWidget {
  const CarDetailsAnimation({Key? key}) : super(key: key);

  @override
  State<CarDetailsAnimation> createState() => _CarDetailsAnimationState();
}

class _CarDetailsAnimationState extends State<CarDetailsAnimation> {
  @override
  Widget build(BuildContext context) {
    return CarDetails();
  }
}

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: _carTitle(),
          ),
          Container(
            width: double.infinity,
            child: CarCarousel(),
          ),
        ],
      ),
    );
  }

  _carTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 38),
              children: [
                TextSpan(text: currentCar.companyName),
                TextSpan(text: "\n"),
                TextSpan(
                    text: currentCar.carName,
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ]),
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                  text: currentCar.price.toString(),
                  style: TextStyle(color: Colors.grey[20])),
              TextSpan(
                text: "/day",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CarCarousel extends StatefulWidget {
  const CarCarousel({Key? key}) : super(key: key);

  @override
  State<CarCarousel> createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = currentCar.imgList!;
  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
      child: Image.asset("assets/assets1/$assetName", fit: BoxFit.fitWidth),
    );
  })!
      .toList();
  static List<T>? _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: child,
            options: CarouselOptions(
                height: 250,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _map<Widget>(imgList, (index, assetName) {
                return Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.grey[100]
                          : Colors.grey[600]),
                );
              })!,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  double sheetTop = 400;
  double minSheetTop = 30;

  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    //TODO: implement initState

    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: sheetTop, end: minSheetTop)
        .animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Positioned(
      top: animation?.value,
      left: 0,
      child: GestureDetector(
        onTap: () {
          controller!.isCompleted
              ? controller?.reverse()
              : controller?.forward();
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          //upward drag
          if (dragEndDetails.primaryVelocity! < 0.0) {
            controller!.forward();
          } else if (dragEndDetails.primaryVelocity! < 0.0) {
            //downward drag
            controller!.reverse();
          }
        },
        child: SheetContainer(),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  const SheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 110;

    return Container(
      padding: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: Color(0xfff1f1f1)),
      child: Column(
        children: [
          drawerHandle(),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                offerDetails(sheetItemHeight),
                specifications(sheetItemHeight),
                features(sheetItemHeight),
                SizedBox(height: 220),
              ],
            ),
          ),
        ],
      ),
    );
  }

  drawerHandle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 3,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffd9dbdb)),
    );
  }

  specifications(double sheetItemHeight) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: [
          Text(
            "specifications",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentCar.specifications?.length,
              itemBuilder: (context, index) {
                return ListItem(
                  sheetItemHeight: sheetItemHeight,
                  mapVal: currentCar.specifications?[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  features(double sheetItemHeight) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: [
          Text(
            "features",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentCar.features?.length,
              itemBuilder: (context, index) {
                return ListItem(
                  sheetItemHeight: sheetItemHeight,
                  mapVal: currentCar.features?[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  offerDetails(double sheetItemHeight) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: [
          Text(
            "Offer Details",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentCar.offerDetails!.length,
              itemBuilder: (context, index) {
                return ListItem(
                  sheetItemHeight: sheetItemHeight,
                  mapVal: currentCar.offerDetails![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final double? sheetItemHeight;
  final Map? mapVal;
  ListItem({this.sheetItemHeight, this.mapVal});
  @override
  Widget build(BuildContext context) {
    var innerMap;
    bool isMap;
    if (mapVal?.values.elementAt(0) is Map) {
      innerMap = mapVal?.values.elementAt(0);
      isMap = true;
    } else {
      innerMap = mapVal;
      isMap = false;
    }
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mapVal?.keys.elementAt(0),
          isMap
              ? Text(innerMap.keys.elementAt(0),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, letterSpacing: 1.2, fontSize: 6))
              : Container(),
          Text(
            innerMap?.values.elementAt(0),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
