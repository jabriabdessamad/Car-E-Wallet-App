import 'package:car_e_wallet_app/parking/parking.dart';
import 'package:car_e_wallet_app/parking/parkingInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'map_markers.dart';

const MARKER_SIZE_EXPANDED = 65;
const MARKER_SIZE_SHRIKED = 42;

class MapWidget extends StatefulWidget {
  String? duration;
  MapWidget({Key? key, this.duration}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final _pageController = PageController();
  int _selectedIndex = 0;

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(Marker(
          height: 55,
          width: 40,
          point: mapItem.location!,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                setState(() {
                  _pageController.animateToPage(i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceInOut);
                });
              },
              child: LocationMarker(
                selected: (_selectedIndex == i),
              ),
            );
          }));
    }
    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    final _markers = _buildMarkers();
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(34.01141095875643, -6.842152555331169),
              maxZoom: 25,
              zoom: 14.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mac1962/cl4exfwzq001p14polw1vlt4n/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFjMTk2MiIsImEiOiJja3dwdHZob3QwZzVkMnZsY3d0d2x0dnM5In0.OvKRt9qd0e_wIw_4fXktVQ",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoibWFjMTk2MiIsImEiOiJja3dwdHZob3QwZzVkMnZsY3d0d2x0dnM5In0.OvKRt9qd0e_wIw_4fXktVQ',
                  'id': 'mapbox.mapbox-streets-v8'
                },
                attributionBuilder: (_) {
                  return Text("");
                },
              ),
              MarkerLayerOptions(markers: _markers),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 50.0,
                    height: 50.0,
                    point: LatLng(34.01141095875643, -6.842152555331169),
                    builder: (ctx) => Image(
                      image: AssetImage('assets/location_logo.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screen_height * 0.25,
            child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mapMarkers.length,
                itemBuilder: (context, index) {
                  final item = mapMarkers[index];
                  return ParkingDetails(
                    mapMarker: item,
                    duration: widget.duration,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class LocationMarker extends StatelessWidget {
  const LocationMarker({Key? key, this.selected = false}) : super(key: key);

  final bool? selected;
  @override
  Widget build(BuildContext context) {
    final size = selected! ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRIKED;
    return Center(
      child: AnimatedContainer(
        height: size.toDouble(),
        width: size.toDouble() - 10,
        duration: const Duration(milliseconds: 400),
        child: Image.asset('assets/parking_icon.png'),
      ),
    );
  }
}

class ParkingDetails extends StatefulWidget {
  ParkingDetails({Key? key, required this.mapMarker, this.duration})
      : super(key: key);
  final MapMarker mapMarker;
  String? duration;

  @override
  State<ParkingDetails> createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Row(
          children: [
            Container(
              height: screen_height * 0.25,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                color: Color(0xFFF0F1F4),
                borderRadius: BorderRadius.all(Radius.circular(7)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 97, 97, 97).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: Text(
                          '${widget.mapMarker.address}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                        child: Text(
                          '${widget.mapMarker.price}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.directions_car,
                      color: Colors.grey[700],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                        child: Text(
                          '${widget.mapMarker.distance}',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
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
                          height: 50,
                          width: screen_width * 0.6,
                          child: TextButton(
                            onPressed: () {
                              print(widget.duration);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ParkingInfo(
                                      parkingAddress: widget.mapMarker.address,
                                      distance: widget.mapMarker.distance,
                                      price: widget.mapMarker.price,
                                      duration: widget.duration,
                                    ),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("Book Here",
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
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
