import 'package:car_e_wallet_app/home/home.dart';
import 'package:car_e_wallet_app/parking/parking_payment.dart';
import 'package:flutter/material.dart';

class ParkingInfo extends StatefulWidget {
  ParkingInfo(
      {Key? key,
      this.parkingAddress,
      this.distance,
      this.price,
      this.entryDateTime,
      this.exitDateTime,
      this.duration})
      : super(key: key);
  String? parkingAddress;
  String? price;
  String? distance;
  DateTime? entryDateTime;
  DateTime? exitDateTime;
  String? duration;

  @override
  State<ParkingInfo> createState() => _ParkingInfoState();
}

class _ParkingInfoState extends State<ParkingInfo> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    DateTime entryDateTime = widget.entryDateTime ?? DateTime.now();
    DateTime exitDateTime = widget.exitDateTime ?? DateTime.now();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: screen_height * 0.43,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/parking_picture.png'),
                                  fit: BoxFit.cover)),
                          height: screen_height * 0.25),
                      Positioned(
                        top: 130,
                        right: screen_width * 0.05,
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              width: screen_width * 0.9,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 97, 97, 97)
                                        .withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 0, 0),
                                        child: Text(
                                          '${widget.parkingAddress}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.directions_walk_outlined,
                                      color: Colors.grey[700],
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 15, 0),
                                        child: Text(
                                          ' ${widget.distance} ',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          color: Colors.grey[400],
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      child: Center(
                                          child: Text('Covered',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF613EEA)))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          color: Colors.grey[400],
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          )),
                                      child: Center(
                                          child: Text('Valet',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF613EEA)))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('+US2.00 fee for large vehivules',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF613EEA)))
                              ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: screen_height * 0.2,
                  width: screen_width * 0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFFE9E6E6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                  '${entryDateTime.month.toString().padLeft(2, '0')}/${entryDateTime.day.toString().padLeft(2, '0')}  ${entryDateTime.hour.toString().padLeft(2, '0')}:${entryDateTime.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 30,
                              ),
                              Text(
                                  '${exitDateTime.month.toString().padLeft(2, '0')}/${exitDateTime.day.toString().padLeft(2, '0')}  ${exitDateTime.hour.toString().padLeft(2, '0')}:${exitDateTime.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Edit Time',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF613EEA)))),
                        )
                      ],
                    ),
                    Container(
                      height: screen_height * 0.11,
                      width: screen_width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${widget.duration}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            Text('20 DH',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('6 hours',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey)),
                            Text('30 DH',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('10 hours',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey)),
                            Text('40 DH',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey))
                          ],
                        )
                      ]),
                    ),
                  ]),
                ),
                SizedBox(
                  height: screen_height * 0.02,
                ),
                Text('Hours of Operation',
                    style: TextStyle(
                        fontSize: screen_height * 0.025,
                        fontWeight: FontWeight.w900,
                        color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text('Mon - Sun 24 hr',
                          style: TextStyle(
                              fontSize: screen_height * 0.025,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF806A6A))),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.02,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Rated 4 out of 5',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF613EEA)))
                      ]),
                ),
                SizedBox(
                  height: screen_height * 0.04,
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 50,
                          width: screen_width * 0.7,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParkingPayment()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("Continue To Book",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA))),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
