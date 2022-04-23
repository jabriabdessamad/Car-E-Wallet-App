import 'package:flutter/material.dart';

class Parking extends StatefulWidget {
  const Parking({Key? key}) : super(key: key);

  @override
  State<Parking> createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  TextEditingController controller = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5 + 30,
            child: Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 5,
                    color: Color(0xff38267E)),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 280) / 2,
                  top: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 60,
                    width: 280,
                    child: TextFormField(
                      controller: controller,
                      onChanged: (text) {
                        setState(() {
                          controller.text.isEmpty
                              ? isVisible = true
                              : isVisible = false;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                        border: InputBorder.none,
                        hintText: 'Enter adress or place',
                        prefixIcon: Visibility(
                          visible: isVisible,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 13, 0, 0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xff38267E),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
