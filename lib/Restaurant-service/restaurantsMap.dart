import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/Restaurant-service/map/map.dart';

class RestaurantsMap extends StatefulWidget {
  DateTime? entryDateTime;
  DateTime? exitDateTime;
  String? place;
  String? duration;
  RestaurantsMap(
      {Key? key,
      this.place,
      this.entryDateTime,
      this.exitDateTime,
      this.duration})
      : super(key: key);

  @override
  State<RestaurantsMap> createState() => _RestaurantsMapState();
}

class _RestaurantsMapState extends State<RestaurantsMap> {
  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(children: [
            MapWidget(
              duration: widget.duration,
            ),
            // Positioned(
            //     left: (MediaQuery.of(context).size.width - 340) / 2,
            //     top: 30,
            //     child: Container(
            //       height: 55,
            //       width: 340,
            //       decoration: BoxDecoration(
            //         color: Color.fromARGB(255, 255, 255, 255),
            //         borderRadius: BorderRadius.all(Radius.circular(7)),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
            //             spreadRadius: 2,
            //             blurRadius: 2,
            //             offset: Offset(0, 3), // changes position of shadow
            //           ),
            //         ],
            //       ),
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //                 padding: EdgeInsets.only(left: 20),
            //                 child: Text(
            //                   widget.place ?? '',
            //                   style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                   ),
            //                 )),
            //           ]),
            //     )),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 13,
            selectedFontSize: 16,
            unselectedItemColor: Colors.grey[100],
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _current_index,
            backgroundColor: Color(0xFFC1853B),
            onTap: (index) {
              setState(() {
                _current_index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 30,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
                label: 'More',
              ),
            ]),
      ),
    );
  }
}
