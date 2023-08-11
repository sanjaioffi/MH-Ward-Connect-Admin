import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdu_admin/map/map_model.dart';
import 'package:flutter/material.dart';

const List<String> issueTypes = [
  'Sewage Leaks',
  'Drainage Issues',
  'Debri Cluster',
  'Damaged Roads',
  'Street Light Issue',
  'Water Wastage',
  'Others',
];

const Map issueMapping = {
  0: 'Sewage Leaks',
  1: 'Drainage Issues',
  2: 'Debri Cluster',
  3: 'Damaged Roads',
  4: 'Street Light Issue',
  5: 'Water Wastage',
  6: 'Others',
};

var bitColorMarker = [
  BitmapDescriptor.hueAzure,
  BitmapDescriptor.hueBlue,
  BitmapDescriptor.hueViolet,
  BitmapDescriptor.hueGreen,
  BitmapDescriptor.hueMagenta,
  BitmapDescriptor.hueOrange,
  BitmapDescriptor.hueRed,
];

List<MapModel> allMapModels = [];

Map<int, IconData> icons = {
  0: Icons.running_with_errors,
  1: Icons.water,
  2: Icons.delete_sweep_sharp,
  3: Icons.priority_high_sharp,
  4: Icons.light,
  5: Icons.water_drop_sharp,
  6: Icons.refresh,
};
