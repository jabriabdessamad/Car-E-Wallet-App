import 'package:flutter/material.dart';

class FavoriteParking extends StatefulWidget {
  const FavoriteParking({Key? key}) : super(key: key);

  @override
  State<FavoriteParking> createState() => _FavoriteParkingState();
}

class _FavoriteParkingState extends State<FavoriteParking> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FavoriteParking'),
    );
  }
}
