import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdu_admin/map/create_markers.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  //
  final LatLng initialLocation =
      const LatLng(10.3624, 77.9695); // San Francisco

// //
  Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('marker_1'),
      position: const LatLng(37.7749, -122.4194),
      infoWindow: const InfoWindow(
        title: 'Custom Marker',
        snippet: 'San Francisco',
        anchor: Offset(1, 1),
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRose,
      ), // Custom marker color
    ),
    Marker(
      markerId: const MarkerId('marker_1'),
      position: const LatLng(37.7749, -122.4194),
      infoWindow: const InfoWindow(
        title: 'Custom Marker',
        snippet: 'San Francisco',
        anchor: Offset(1, 1),
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRose,
      ), // Custom marker color
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 10,
          ),
          markers: createMarkers(),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
        ),
      ),
    );
  }
}
