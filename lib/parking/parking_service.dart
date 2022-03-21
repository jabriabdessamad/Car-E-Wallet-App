import 'package:car_e_wallet_app/parking/rpscustomerpainter.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/parking/navigation_bottom_bar.dart';

class ParkingService extends StatefulWidget {
  const ParkingService({Key? key}) : super(key: key);

  @override
  State<ParkingService> createState() => _ParkingServiceState();
}

class _ParkingServiceState extends State<ParkingService> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),

            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Color(0xff38267E),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'SEARCH TO RESERVE PARKING',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                CustomPaint(
                                  size: Size(500, 150),
                                  painter: RPSCustomPainter(),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50),
                                      Text(
                                        'Search begins here',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      Text(
                                        '      Tell us your destination and when you\n       would like to arrive and leave',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 101,
                          ),
                          Text(
                            'RESERVE PARKING',
                            style: TextStyle(
                                color: Color(0xFF613EEA),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            'PAY WITH YOUR PHONE',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            'SAVE UP TO 50%',
                            style: TextStyle(
                                color: Color(0xFF613EEA),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/blue parked car 1.png'),
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 70.0,
            child: Center(
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  CustomPaint(
                    size: Size(500, 500),
                    painter: RPsSCustomPainter(),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Icon(
                          Icons.search,
                        ),
                        onPressed: () {},
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: Color(0xff806A6A),
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Color(0xff613EEA),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.history,
                            color: Color(0xff806A6A),
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Color(0xff613EEA),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.hourglass_empty,
                            color: Color(0xffF0F1F4),
                            size: 2,
                          ),
                          onPressed: () {},
                          splashColor: Color(0xff613EEA),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Color(0xff806A6A),
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Color(0xff613EEA),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color(0xff806A6A),
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Color(0xff613EEA),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
