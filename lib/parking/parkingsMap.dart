import 'package:car_e_wallet_app/parking/map/map.dart';
import 'package:car_e_wallet_app/parking/parkingInfo.dart';
import 'package:flutter/material.dart';

class ParkingsMap extends StatefulWidget {
  DateTime? entryDateTime;
  DateTime? exitDateTime;
  String? place;
  String? duration;
  ParkingsMap(
      {Key? key,
      this.place,
      this.entryDateTime,
      this.exitDateTime,
      this.duration})
      : super(key: key);

  @override
  State<ParkingsMap> createState() => _ParkingsMapState();
}

class _ParkingsMapState extends State<ParkingsMap> {
  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    DateTime entryDateTime = widget.entryDateTime ?? DateTime.now();
    DateTime exitDateTime = widget.exitDateTime ?? DateTime.now();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(children: [
            MapWidget(
              duration: widget.duration,
            ),
            Positioned(
                left: (MediaQuery.of(context).size.width - 340) / 2,
                top: 30,
                child: Container(
                  height: 55,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              widget.place ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )),
                        Container(
                          child: Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${entryDateTime.hour.toString().padLeft(2, '0')}:${entryDateTime.minute.toString().padLeft(2, '0')} ',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${entryDateTime.month.toString().padLeft(2, '0')} / ${entryDateTime.day.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${exitDateTime.hour.toString().padLeft(2, '0')}:${exitDateTime.minute.toString().padLeft(2, '0')} ',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${exitDateTime.month.toString().padLeft(2, '0')} / ${exitDateTime.day.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      color: Color(0xFF613EEA),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ]),
                        )
                      ]),
                )),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 13,
            selectedFontSize: 16,
            unselectedItemColor: Colors.grey[400],
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _current_index,
            backgroundColor: Color(0xFF13054E),
            onTap: (index) {
              setState(() {
                _current_index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 30,
                ),
                label: 'My parking',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
                label: 'More',
              ),
            ]),
      ),
    );
  }
}
