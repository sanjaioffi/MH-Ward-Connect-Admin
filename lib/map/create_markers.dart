import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdu_admin/constants/constants.dart';
import 'dart:math';

final Random random = Random();

Set<Marker> createMarkers() {
  Set<Marker> locationCordinates = {};
  for (var i = 0; i < allMapModels.length; i++) {
    locationCordinates.add(
      Marker(
        markerId: MarkerId('marker $i'),
        position: LatLng(
          allMapModels[i].lat,
          allMapModels[i].lng,
        ),
        infoWindow: InfoWindow(
          title: issueMapping[allMapModels[i].issueType],
          snippet: 'Ward Number : ${allMapModels[i].ward}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          bitColorMarker[random.nextInt(6)],
        ), // Custom marker color
      ),
    );
  }
  return locationCordinates;
}
