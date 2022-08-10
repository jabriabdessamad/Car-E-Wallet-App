import 'dart:convert';

import 'package:car_e_wallet_app/authenticate/register.dart';
import 'package:car_e_wallet_app/home/home.dart';
import 'package:car_e_wallet_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_e_wallet_app/services/API/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService? _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? email = '';
  String? password = '';
  String? error = '';
  String? errorText;
  bool validate = false;
  bool circular = false;

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'email', errorText: errorText),
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
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: 'password', errorText: errorText),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter password' : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        obscureText: true,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            "forgot password? ",
                            style: TextStyle(
                                color: Color(0xff613EEA), fontSize: 12),
                          ),
                          onPressed: () {},
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () async {
                            setState(() {
                              circular = true;
                            });
                            if (_formkey.currentState!.validate()) {
                              Map<String, String> data = {
                                "email": _emailController.text,
                                "password": _passwordController.text
                              };
                              var response =
                                  await networkHandler.post('user/login', data);
                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                Map<String, dynamic> output =
                                    json.decode(response.body);

                                print(output["token"]);
                                await storage.write(
                                    key: "token", value: output["token"]);
                                setState(() {
                                  validate = true;
                                  circular = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              } else {
                                String output = json.decode(response.body);
                                setState(() {
                                  validate = false;
                                  errorText = output;
                                  circular = false;
                                });
                              }
                              // dynamic result = await _auth!
                              //     .signInWithEmailAndPassword(
                              //         email!, password!);
                              // if (result == null) {
                              //   setState(() {
                              //     error =
                              //         'Could not sign with those credentials';
                              //   });
                              // } else {
                              //   Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()),
                              //     (Route<dynamic> route) => false,
                              //   );
                              // }

                            } else {
                              setState(() {
                                circular = false;
                              });
                            }
                          },
                          child: circular
                              ? CircularProgressIndicator()
                              : Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Container(
                            child: Text.rich(
                          TextSpan(
                            text: 'or ',
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(color: Color(0xff613EEA))),
                            ],
                          ),
                        )),
                      )
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
