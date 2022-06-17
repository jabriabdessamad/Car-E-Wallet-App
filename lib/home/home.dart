import 'package:car_e_wallet_app/authenticate/authenticate.dart';
import 'package:car_e_wallet_app/chart.dart';
import 'package:car_e_wallet_app/home/navbar.dart';
import 'package:car_e_wallet_app/parking/parking.dart';
import 'package:car_e_wallet_app/services/auth.dart';
import 'package:car_e_wallet_app/wrapper.dart';
import 'package:car_e_wallet_app/parking/parking_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final AuthService _auth = AuthService();
  String dropdownValue = 'Jan - Feb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Navbar(),
      body: Container(
        child: Column(children: [
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 130,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover)),
              ),
              TextButton(
                onPressed: () {
                  _globalKey.currentState!.openDrawer();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            alignment: Alignment.topLeft,
            child: Text(
              'Acount Overview',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: Color(0xffE9E6E6),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Column(
                      children: [
                        Text('Current Balance',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Text(
                          '3000 \$',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ], shape: BoxShape.circle, color: Color(0xff38267E)),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                ]),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xff38267E),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: FaIcon(
                          FontAwesomeIcons.arrowUp,
                          color: Color(0xff38267E),
                        ),
                      ),
                    ),
                    Text(
                      'Send money',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff613EEA),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xff38267E),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: FaIcon(
                          FontAwesomeIcons.arrowDown,
                          color: Color(0xff38267E),
                        ),
                      ),
                    ),
                    Text(
                      'Recieve money',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff613EEA),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xff38267E),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: FaIcon(
                          FontAwesomeIcons.history,
                          color: Color(0xff38267E),
                        ),
                      ),
                    ),
                    Text(
                      'Historique',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff613EEA),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  'Stats',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Color(0xff38267E),
                    size: 25,
                  ),
                  elevation: 16,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Jan - Feb',
                    'Feb - Mar',
                    'Mar - Apr',
                    'Apr - May'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Chart(),
          ),
          Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Services',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                serviceWidget("parking", "Parking\n", Parking()),
                serviceWidget("restaurant", "Restaus\n", Parking()),
                serviceWidget("station de recharge", "Stations\n", Parking()),
                serviceWidget("tram", "Tram\n", Parking()),
                serviceWidget("bus", "Bus\n", Parking()),
                serviceWidget("more", "More\n", Parking()),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // side navbar

  Column serviceWidget(String img, String name, Widget nextscreen) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Parking()),
            );
          },
          child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xfff1f3f6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                height: 55,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/$img.png'),
                )),
              )),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'avenir',
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
