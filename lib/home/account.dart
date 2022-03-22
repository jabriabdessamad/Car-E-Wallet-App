import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38267E),
        title: Text(
          'Your account',
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
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
