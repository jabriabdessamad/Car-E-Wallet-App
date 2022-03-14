import 'package:car_e_wallet_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.SignOut();
              },
              icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
