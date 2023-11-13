import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSeach extends StatefulWidget {
  const LocationSeach({super.key});

  @override
  State<LocationSeach> createState() => _LocationSeachState();
}

class _LocationSeachState extends State<LocationSeach> {
  final TextEditingController _searchController = TextEditingController();
  bool _isTextFieldVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MapView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _isTextFieldVisible = true;
            // Ce boolean fera apparaitre une bar de recherche qui demande d'inserer un numero de bus.
            // Apres validation le bus apparait sur la map
          });
        },
        label: const Text('Search'),
        icon: const Icon(Icons.directions_boat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
