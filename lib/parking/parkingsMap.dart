import 'package:car_e_wallet_app/parking/map.dart';
import 'package:car_e_wallet_app/parking/parkingInfo.dart';
import 'package:flutter/material.dart';

class ParkingsMap extends StatefulWidget {
  const ParkingsMap({Key? key}) : super(key: key);

  @override
  State<ParkingsMap> createState() => _ParkingsMapState();
}

class _ParkingsMapState extends State<ParkingsMap> {
  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(children: [
            MapWidget(),
            Positioned(
                left: (MediaQuery.of(context).size.width - 340) / 2,
                top: 30,
                child: Container(
                  height: 55,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Rabat',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )),
                        Container(
                          child: Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '3:30PM',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'mars 3',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '3:30PM',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'mars 3',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      ]),
                )),
            Positioned(
              bottom: 10,
              right: screen_width * 0.05,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: screen_width * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F1F4),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Text(
                                'City Club Hassan 2',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                              child: Text(
                                ' 17.00 DH',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ))
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
                              padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                              child: Text(
                                ' 6 min walk ',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 97, 97, 97)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
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
                                          builder: (context) => ParkingInfo()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text("Book Here",
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
                    ]),
                  ),
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 13,
            selectedFontSize: 16,
            unselectedItemColor: Colors.grey[400],
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _current_index,
            backgroundColor: Color(0xFF13054E),
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
                label: 'My parking',
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
