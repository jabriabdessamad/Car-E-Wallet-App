import 'package:flutter/material.dart';

class RestaurantHistory extends StatefulWidget {
  const RestaurantHistory({Key? key}) : super(key: key);

  @override
  State<RestaurantHistory> createState() => _RestaurantHistoryState();
}

class _RestaurantHistoryState extends State<RestaurantHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('RestaurantHistory'));
  }
}
