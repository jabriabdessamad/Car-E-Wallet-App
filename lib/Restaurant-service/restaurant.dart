import 'package:car_e_wallet_app/Restaurant-service/favoriteRestaurant/favoriteRestaurant.dart';
import 'package:car_e_wallet_app/Restaurant-service/history/restaurantHistory.dart';
import 'package:car_e_wallet_app/Restaurant-service/more/restaurantMore.dart';
import 'package:car_e_wallet_app/Restaurant-service/restaurantIntroduction.dart';
import 'package:car_e_wallet_app/favoriteParking/FavoriteParking.dart';
import 'package:car_e_wallet_app/moreOptions/more.dart';
import 'package:car_e_wallet_app/myParking/myParking.dart';
import 'package:car_e_wallet_app/parking/ParkingIntroduction.dart';
import 'package:car_e_wallet_app/parking/rpscustomerpainter.dart';
import 'package:car_e_wallet_app/parking/searchParking.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/parking/navigation_bottom_bar.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  TextEditingController controller = TextEditingController();
  bool isVisible = true;
  int _current_index = 0;
  List<Widget> _widgetOptions = [
    RestaurantIntroduction(),
    RestaurantHistory(),
    FavoriteRestaurant(),
    RestaurantMore()
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
