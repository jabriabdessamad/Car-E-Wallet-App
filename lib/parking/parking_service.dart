import 'package:car_e_wallet_app/parking/rpscustomerpainter.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/parking/navigation_bottom_bar.dart';

class ParkingService extends StatefulWidget {
  const ParkingService({Key? key}) : super(key: key);

  @override
  State<ParkingService> createState() => _ParkingServiceState();
}

class _ParkingServiceState extends State<ParkingService> {
  Color _iconColor1 = Color(0xff806A6A);
  Color _iconColor2 = Color(0xff806A6A);
  Color _iconColor3 = Color(0xff806A6A);
  Color _iconColor4 = Color(0xff806A6A);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,

                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Color(0xff38267E),
          ),
          child: Padding(
            padding: EdgeInsets.all(52),
            child: Text(
              'SEARSH TO RESERVE PARKING',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
            child: Column(
          children: [
            Container(
              height: 130,
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Center(
                  child: Stack(
                children: <Widget>[
                  CustomPaint(
                    size: Size(350, 130),
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
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            )
          ],
        )),
        Expanded(
          child: Column(
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
                      textAlign: TextAlign.start,
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
        ),
        Container(
          alignment: Alignment.bottomCenter,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: _iconColor1,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _iconColor1 = Color(0xff613EEA);
                            _iconColor2 = Color(0xff806A6A);
                            _iconColor3 = Color(0xff806A6A);
                            _iconColor4 = Color(0xff806A6A);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.history,
                          color: _iconColor2,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _iconColor2 = Color(0xff613EEA);
                            _iconColor1 = Color(0xff806A6A);
                            _iconColor3 = Color(0xff806A6A);
                            _iconColor4 = Color(0xff806A6A);
                          });
                        },
                      ),
                      TextButton(
                        child: Icon(
                          Icons.search,
                          size: 40,
                          color: Color(0xff613EEA),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _iconColor3,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _iconColor3 = Color(0xff613EEA);
                            _iconColor2 = Color(0xff806A6A);
                            _iconColor1 = Color(0xff806A6A);
                            _iconColor4 = Color(0xff806A6A);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: _iconColor4,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _iconColor4 = Color(0xff613EEA);
                            _iconColor2 = Color(0xff806A6A);
                            _iconColor3 = Color(0xff806A6A);
                            _iconColor1 = Color(0xff806A6A);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
