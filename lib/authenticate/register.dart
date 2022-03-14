import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService? _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String? email = '';
  String? password = '';
  String? error = '';
  String? name = '';
  String? phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png'),
                                fit: BoxFit.cover)),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'full name'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter your name ' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'phone number'),
                        validator: (val) =>
                            val!.length < 6 ? 'enter your phone number' : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'password'),
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? 'password should be atleast 6 char'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("or sign up with"),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'f',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Facebook',
                                        style:
                                            TextStyle(color: Color(0xff613EEA)))
                                  ],
                                ),
                              ),
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'G',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Google',
                                      style:
                                          TextStyle(color: Color(0xff613EEA)),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 260,
                        decoration: BoxDecoration(
                          color: Color(0xff38267E),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = await _auth!
                                  .registerWithEmailAndPassword(
                                      email!, password!);
                              if (result == null) {
                                setState(() {
                                  error = 'please supply a valid email ';
                                });
                              }
                            }
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            'already have an acount',
                            style: TextStyle(
                                color: Color(0xff613EEA), fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(error!)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
