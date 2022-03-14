import 'package:car_e_wallet_app/authenticate/register.dart';
import 'package:car_e_wallet_app/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F4F3),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '12:22 PM',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                    ),
                    Text('  March 10,  2022')
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cloud,
                      color: Color(0xff613EEA),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('25 °C')
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover)),
          ),
          // ignore: prefer_const_constructors
          Container(
            height: 70,
            width: 200,
            child: Text(
              'Open An Account For Digital Car E-Wallet solutions.Instant Payouts.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            child: Text(
              'Join For Free',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 260,
            decoration: BoxDecoration(
              color: Color(0xff38267E),
              borderRadius: BorderRadius.all(Radius.circular(7)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'create an account',
                style: TextStyle(color: Color(0xff613EEA), fontSize: 12),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
