import 'package:car_e_wallet_app/authenticate/authenticate.dart';
import 'package:car_e_wallet_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Widget page = Authenticate();
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await storage.read(key: 'token');
    if (token != null) {
      setState(() {
        page = HomePage();
      });
    } else {
      page = Authenticate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
