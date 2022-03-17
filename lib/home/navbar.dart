import 'package:car_e_wallet_app/services/auth.dart';
import 'package:car_e_wallet_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final AuthService? _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: MediaQuery.of(context).size.width * 0.55,
      child: Drawer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      // borderRadius:
                      // BorderRadius.only(bottomRight: Radius.circular(60)),
                      color: Color(0xff38267E)),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/avatar1.png')),
                              shape: BoxShape.circle,
                              color: Color(0xfff1f3f6),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jabri ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Rabat Agdal",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  navigatorTitle(
                      "Home",
                      true,
                      Icon(
                        Icons.home,
                        color: Colors.black,
                      )),
                  navigatorTitle(
                      "Account",
                      false,
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  navigatorTitle(
                      "Transactions",
                      false,
                      Icon(
                        Icons.payment,
                        color: Colors.black,
                      )),
                  navigatorTitle(
                    "Protfolio",
                    false,
                    Icon(
                      Icons.show_chart,
                      color: Colors.black,
                    ),
                  ),
                  navigatorTitle(
                      "Settings",
                      false,
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      )),
                  navigatorTitle(
                      "Help",
                      false,
                      Icon(
                        Icons.help,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () async {
                    await _auth!.SignOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wrapper()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        size: 30,
                        color: Color(0xff613EEA),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff613EEA)),
                      )
                    ],
                  ),
                )),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              child: Text(
                "Ver 2.0.1",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row navigatorTitle(String name, bool isSelected, Icon icon) {
    return Row(
      children: [
        (isSelected)
            ? Container(
                width: 5,
                height: 60,
                color: Color(0xffffac30),
              )
            : Container(
                width: 5,
                height: 60,
              ),
        SizedBox(
          width: 10,
          height: 60,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                        (isSelected) ? FontWeight.w700 : FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
