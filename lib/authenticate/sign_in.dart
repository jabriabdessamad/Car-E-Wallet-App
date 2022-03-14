import 'package:car_e_wallet_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService? _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String? email = '';
  String? password = '';
  String? error = '';

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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Text.rich(
                        TextSpan(
                          text: 'or ',
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Sign up',
                                style: TextStyle(color: Color(0xff613EEA))),
                          ],
                        ),
                      ))
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
