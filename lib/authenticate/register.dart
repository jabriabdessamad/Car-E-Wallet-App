import 'package:car_e_wallet_app/authenticate/sign_in.dart';
import 'package:car_e_wallet_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:car_e_wallet_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:car_e_wallet_app/services/API/NetwrkHandler.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService? _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //text field state
  String? email = '';
  String? password = '';
  String? error = '';
  String? name = '';
  String? phone_number = '';
  String? errorText;
  bool validate = false;
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        height: screen_height * 0.2,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png'),
                                fit: BoxFit.cover)),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(hintText: 'full name'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter your name ' : null,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(hintText: 'phone number'),
                        validator: (val) =>
                            val!.length < 6 ? 'enter your phone number' : null,
                        onChanged: (val) {
                          setState(() {
                            phone_number = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'email',
                          errorText: validate ? null : errorText,
                        ),
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
                                      'Google ',
                                      style:
                                          TextStyle(color: Color(0xff613EEA)),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      circular
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 260,
                              decoration: BoxDecoration(
                                color: Color(0xff38267E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    circular = true;
                                  });
                                  await CheckUser();
                                  if (_formKey.currentState!.validate() &&
                                      validate) {
                                    Map<String, String> data = {
                                      "username": _nameController.text,
                                      "email": _emailController.text,
                                      "phonenumber":
                                          _phoneNumberController.text,
                                      "password": _passwordController.text
                                    };
                                    print(data);
                                    await networkHandler.post(
                                        "user/register", data);
                                    setState(() {
                                      circular = false;
                                    });

                                    // dynamic result = await _auth!
                                    //     .registerWithEmailAndPassword(
                                    //         email!, password!);

                                    // if (result == null) {
                                    //   setState(() {
                                    //     error = 'please supply a valid email ';
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
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
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

  CheckUser() async {
    if (_emailController.text.length == 0) {
      setState(() {
        validate = false;
        errorText = 'Please enter your email';
      });
    } else {
      var response =
          await networkHandler.get("user/checkemail/${_emailController.text}");
      if (response['status']) {
        setState(() {
          validate = false;
          errorText = 'email already used';
        });
      } else {
        setState(() {
          validate = true;
        });
      }
    }
  }
}
