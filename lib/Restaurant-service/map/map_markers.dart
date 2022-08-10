import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.distance,
    required this.location,
  });
  final String? image;
  final String? title;
  final String? address;
  final String? distance;
  final LatLng? location;
}

final _locations = [
  LatLng(34.00600359148189, -6.843869168988556),
  LatLng(34.009703406290406, -6.837002714359004),
  LatLng(33.99390691823165, -6.837861021187699),
  LatLng(34.00856501890274, -6.834942777970139),
];

final mapMarkers = [
  MapMarker(
    image: 'assets/kfc.png',
    title: "KFC Rabat Agdal",
    address: 'KFC Rabat Agdal',
    distance: "6 min drive",
    location: LatLng(34.00315747040387, -6.857602078247661),
  ),
  MapMarker(
    image: 'assets/burger.png',
    title: "Burger King Rabat",
    address: 'Burger King Rabat',
    distance: "15 min drive",
    location: LatLng(34.005434374896545, -6.844384153085773),
  ),
  MapMarker(
    image: 'assets/pizzahut.png',
    title: "Pizza Hut Rabat",
    address: 'Pizza Hut Rabat',
    distance: "30 min drive",
    location: LatLng(34.01909451989349, -6.835629423433094),
  ),
  MapMarker(
    image: 'assets/mc.png',
    title: "Mcdonald's Rabat",
    address: "Mcdonald's  Rabat",
    distance: "30 min drive",
    location: LatLng(33.994191565626565, -6.837861021187699),
  )
];
