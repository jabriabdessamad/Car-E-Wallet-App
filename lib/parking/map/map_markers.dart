import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.distance,
    required this.price,
    required this.location,
  });
  final String? image;

  final String? title;
  final String? address;
  final String? distance;
  final String? price;
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
    image: 'Parking gare Agdal',
    title: "Parking gare Agdal",
    address: 'Parking gare Agdal',
    distance: "6 min drive",
    price: "10 DH",
    location: LatLng(34.00315747040387, -6.857602078247661),
  ),
  MapMarker(
    image: 'Entrée Parking Souterrain',
    title: "Entrée Parking Souterrain",
    address: 'Entrée Parking Souterrain',
    distance: "15 min drive",
    price: '10 DH',
    location: LatLng(34.005434374896545, -6.844384153085773),
  ),
  MapMarker(
    image: 'Parking de la gare',
    title: "Parking de la gare",
    address: 'Parking de la gare',
    distance: "30 min drive",
    price: '15 DH',
    location: LatLng(34.01909451989349, -6.835629423433094),
  ),
  MapMarker(
    image: 'Parking Scène OLM',
    title: "Parking Scène OLM",
    address: 'Parking Scène OLM',
    distance: "30 min drive",
    price: '17 DH',
    location: LatLng(33.994191565626565, -6.837861021187699),
  )
];
