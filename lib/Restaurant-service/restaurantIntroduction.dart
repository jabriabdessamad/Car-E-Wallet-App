import 'package:car_e_wallet_app/Restaurant-service/searchRestaurant.dart';
import 'package:car_e_wallet_app/parking/searchParking.dart';
import 'package:flutter/material.dart';

import '../Restaurant-service/rpscustomerpainter.dart';

class RestaurantIntroduction extends StatefulWidget {
  const RestaurantIntroduction({Key? key}) : super(key: key);

  @override
  State<RestaurantIntroduction> createState() => _RestaurantIntroductionState();
}

class _RestaurantIntroductionState extends State<RestaurantIntroduction> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5 + 30,
                child: Stack(
                  children: [
                    Container(
                      height: screen_height / 5,
                      width: screen_width,
                      color: Color(0xffC1853B),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            'Search For The best  ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                          Container(
                              child: Text(
                            'Restaurants! ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width - 280) / 2,
                      top: 100,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 97, 97, 97)
                                    .withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 60,
                          width: 280,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchRestaurant()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Color(0xffC1853B),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    'Enter adress or place',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    height: screen_height * 0.2,
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
                          margin: EdgeInsets.only(left: 15),
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '   Enter your place and see the best near by reastaurants',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
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
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                'Find the best restaurants  ',
                                style: TextStyle(
                                    color: Color(0xFFC1853B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                width: screen_width * 0.8,
                                child: FittedBox(
                                  child: Text(
                                    'Check their menues, prices and client reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screen_width * 0.5,
                        ),
                        Container(
                          height: screen_height * 0.1,
                          width: screen_width * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/tajin.png'),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
