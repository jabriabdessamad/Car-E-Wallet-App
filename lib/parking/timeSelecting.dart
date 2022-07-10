import 'package:car_e_wallet_app/parking/parkingsMap.dart';
import 'package:car_e_wallet_app/parking/searchParking.dart';
import 'package:flutter/material.dart';

class TimeSelecting extends StatefulWidget {
  String? place;
  TimeSelecting({
    Key? key,
    this.place,
  }) : super(key: key);

  @override
  State<TimeSelecting> createState() => _TimeSelectingState();
}

class _TimeSelectingState extends State<TimeSelecting> {
  bool isVisible = true;
  int _current_index = 0;
  TextEditingController controller = TextEditingController();
  DateTime? entryDateTime = DateTime.now();
  DateTime? exitDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;

    final entryHours = entryDateTime!.hour.toString().padLeft(2, '0');
    final entryMinutes = entryDateTime!.minute.toString().padLeft(2, '0');
    final exitHours = exitDateTime!.hour.toString().padLeft(2, '0');
    final exitMinutes = exitDateTime!.minute.toString().padLeft(2, '0');
    final duration = exitDateTime!
        .add(Duration(minutes: 1))
        .difference(entryDateTime!)
        .inHours
        .toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 97, 97, 97)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 55,
                          width: screen_width * 0.9,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchParking()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Color(0xff38267E),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    widget.place ?? 'Rabat',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.15,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 97, 97, 97)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 55,
                          width: screen_width * 0.9,
                          child: TextButton(
                            onPressed: pickEntryDateTime,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    'Arrive after',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: screen_width * 0.18,
                                ),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      '${entryDateTime!.year.toString()}/${entryDateTime!.month.toString().padLeft(2, '0')}/${entryDateTime!.day.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$entryHours:$entryMinutes',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ]),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 97, 97, 97)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 55,
                          width: screen_width * 0.9,
                          child: TextButton(
                            onPressed: pickExitDateTime,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    'Exit before',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: screen_width * 0.18,
                                ),
                                Container(
                                  child: Row(children: [
                                    Text(
                                      '${exitDateTime!.year}/${exitDateTime!.month.toString().padLeft(2, '0')}/${exitDateTime!.day.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$exitHours:$exitMinutes',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ]),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Text("Duration:${duration} h",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF613EEA))),
                    )
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.2,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 97, 97, 97)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 55,
                          width: screen_width * 0.8,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParkingsMap(
                                          place: widget.place,
                                          duration: duration,
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("Find parking",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF613EEA))),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

  Future pickEntryDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => entryDateTime = dateTime);
  }

  Future pickExitDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => exitDateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime(
          entryDateTime!.year, entryDateTime!.month, entryDateTime!.day),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: entryDateTime!.hour, minute: entryDateTime!.minute));
}
