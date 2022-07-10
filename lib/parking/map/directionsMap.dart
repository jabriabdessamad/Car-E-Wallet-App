import 'package:car_e_wallet_app/parking/parking.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'map_markers.dart';
import 'map_markers.dart';

const MARKER_SIZE_EXPANDED = 65;
const MARKER_SIZE_SHRIKED = 42;

class DirectionsMap extends StatefulWidget {
  String? duration;
  String? parkingAddress;
  DirectionsMap({Key? key, this.duration, this.parkingAddress})
      : super(key: key);

  @override
  State<DirectionsMap> createState() => _DirectionsMapState();
}

class _DirectionsMapState extends State<DirectionsMap> {
  MapMarker? findParkingLocation(
      List<MapMarker> parkings, String parkingAddress) {
    final index =
        parkings.indexWhere((element) => element.address == parkingAddress);
    if (index >= 0) {
      return parkings[index];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                    Marker(
                        width: 50.0,
                        height: 45.0,
                        point: findParkingLocation(
                                mapMarkers, widget.parkingAddress!)!
                            .location!,
                        builder: (ctx) =>
                            Image(image: AssetImage('assets/parking_icon.png')))
                  ],
                ),
                PolylineLayerOptions(polylines: [
                  new Polyline(points: [
                    LatLng(34.01141095875643, -6.842152555331169),
                    findParkingLocation(mapMarkers, widget.parkingAddress!)!
                        .location!
                  ], strokeWidth: 2.0, color: Colors.red)
                ])
              ],
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.parkingAddress}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black))
                      ]),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: screen_height * 0.15,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 29, 8, 110),
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
                        width: screen_width * 0.7,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Parking()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Back To Home Page",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
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
