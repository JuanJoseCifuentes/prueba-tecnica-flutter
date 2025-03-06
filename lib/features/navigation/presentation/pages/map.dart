import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  LatLng _currentPosition = LatLng(0, 0);
  bool _locationReady = false;
  Set<Marker> _marker = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getMarker();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print("Se denegó el permiso");
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _locationReady = true;
    });

    _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  Future<void> _getMarker() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_locationReady) ? GoogleMap(
        initialCameraPosition:
            CameraPosition(target: _currentPosition, zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _marker,
      ) : Text("Consiguiendo permisos...")
    );
  }
}
