import 'package:car_e_wallet_app/favoriteParking/FavoriteParking.dart';
import 'package:car_e_wallet_app/moreOptions/more.dart';
import 'package:car_e_wallet_app/myParking/myParking.dart';
import 'package:car_e_wallet_app/parking/ParkingIntroduction.dart';
import 'package:car_e_wallet_app/parking/rpscustomerpainter.dart';
import 'package:car_e_wallet_app/parking/searchParking.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/parking/navigation_bottom_bar.dart';

class Parking extends StatefulWidget {
  const Parking({Key? key}) : super(key: key);

  @override
  State<Parking> createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  TextEditingController controller = TextEditingController();
  bool isVisible = true;
  int _current_index = 0;
  List<Widget> _widgetOptions = [
    ParkingIntroduction(),
    MyParking(),
    FavoriteParking(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_current_index),
        bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 13,
            selectedFontSize: 16,
            unselectedItemColor: Colors.grey[400],
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _current_index,
            backgroundColor: Color(0xFF13054E),
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
                label: 'My parking',
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
