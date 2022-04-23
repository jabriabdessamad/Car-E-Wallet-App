import 'package:car_e_wallet_app/home/acount/profile.dart';

import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Color _cardColor1 = Colors.white;
  Color _cardColor2 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _textColor2 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38267E),
        title: Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
              icon: Image.asset(
                'assets/blue parked car 1.png',
              ),
              iconSize: 145,
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'You are signed in as:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF613EEA),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
              SizedBox(height: 12),
              Text(
                'IBRAHIMKENIA2@GMAIL.COM',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(
                        "MY PROFILE",
                        style: TextStyle(
                            color: _textColor1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          _cardColor2 = Colors.white;
                          _textColor2 = Colors.black;
                          _cardColor1 = Color(0xff613EEA);
                          _textColor1 = Colors.white;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                    ),
                    color: _cardColor1,
                  ),
                  Card(
                    child: ListTile(
                      title: Text("MY VEHICLES",
                          style: TextStyle(
                              color: _textColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onTap: () {
                        setState(() {
                          _cardColor1 = Colors.white;
                          _textColor1 = Colors.black;
                          _cardColor2 = Color(0xff613EEA);
                          _textColor2 = Colors.white;
                        });
                      },
                    ),
                    color: _cardColor2,
                  ),
                ],
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
