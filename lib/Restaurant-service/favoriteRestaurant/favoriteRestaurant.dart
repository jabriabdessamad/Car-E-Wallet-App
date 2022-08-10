import 'package:flutter/material.dart';

class FavoriteRestaurant extends StatefulWidget {
  const FavoriteRestaurant({Key? key}) : super(key: key);

  @override
  State<FavoriteRestaurant> createState() => _FavoriteRestaurantState();
}

class _FavoriteRestaurantState extends State<FavoriteRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('FavoriteRestaurant'));
  }
}
