import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
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
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(),
            ),
          ],
        ),
      ],
    );
  }
}
