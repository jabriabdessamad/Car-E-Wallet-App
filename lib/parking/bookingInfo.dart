import 'dart:async';
import 'package:car_e_wallet_app/parking/ParkingIntroduction.dart';
import 'package:car_e_wallet_app/parking/map/directionsMap.dart';
import 'package:car_e_wallet_app/parking/map/map.dart';
import 'package:car_e_wallet_app/parking/parking.dart';
import 'package:car_e_wallet_app/parking/parkingsMap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class BookingInfo extends StatefulWidget {
  String? parkingAddress;
  String? price;
  String? distance;
  DateTime? entryDateTime;
  DateTime? exitDateTime;
  String? duration;
  BookingInfo(
      {Key? key,
      this.parkingAddress,
      this.distance,
      this.price,
      this.entryDateTime,
      this.exitDateTime,
      this.duration})
      : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  @override
  void initState() {
    super.initState();

    // simply use this
    Timer.run(() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  'Space Successfully Booked',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(children: [
            SizedBox(
              height: screen_height * 0.12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: QrImage(
                      data:
                          'https://www.linkedin.com/in/abdessamad-jabri-739374225/'),
                ),
              ],
            ),
            Text('Unique ID :CPA-0129'),
            SizedBox(
              height: 20,
            ),
            Container(
              height: screen_height * 0.25,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xFFE9E6E6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Text('Booking Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Check-in Time',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        '3:30 PM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Check-out Time (Est):',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        '6:30 PM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Specifications:',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        'None',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don't know the route?",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DirectionsMap(
                                    parkingAddress: widget.parkingAddress,
                                  )));
                    },
                    child:
                        Text("Get Directions", style: TextStyle(fontSize: 18)))
              ],
            ),
            SizedBox(
              height: screen_height * 0.08,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 97, 97, 97)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 50,
                      width: screen_width * 0.7,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Parking()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Back To Home Page",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF613EEA))),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
