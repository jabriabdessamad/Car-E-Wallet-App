import 'package:car_e_wallet_app/authenticate/authenticate.dart';
import 'package:car_e_wallet_app/authenticate/register.dart';
import 'package:car_e_wallet_app/authenticate/sign_in.dart';
import 'package:car_e_wallet_app/home/home.dart';
import 'package:car_e_wallet_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Customer?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Authenticate();
    }
  }
}
