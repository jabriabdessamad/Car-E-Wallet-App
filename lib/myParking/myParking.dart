import 'package:flutter/material.dart';

class MyParking extends StatefulWidget {
  const MyParking({Key? key}) : super(key: key);

  @override
  State<MyParking> createState() => _MyParkingState();
}

class _MyParkingState extends State<MyParking> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("My Parking"),
    );
  }
}
