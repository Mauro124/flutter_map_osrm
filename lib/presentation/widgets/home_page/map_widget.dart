import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:flutter_map_osrm/presentation/widgets/home_page/polyline_builder_widget.dart';
import 'package:flutter_map_osrm/services/geolocator_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final List<MapLocation> locations;

  const MapWidget({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GeolocatorServices.getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          Position currentPosition = snapshot.data as Position;

          return FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: LatLng(currentPosition.latitude, currentPosition.longitude),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_map_osrm',
              ),
              MarkerLayer(
                markers: _buildMarkers(),
              ),
              PolylineBuilderWidget(locations: locations),
            ],
          );
        });
  }

  _buildMarkers() {
    return locations.map((location) {
      return Marker(
        point: LatLng(location.latitude, location.longitude),
        width: 32,
        height: 32,
        child: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            IconData(0xe2a0, fontFamily: 'MaterialIcons'),
            color: Colors.white,
            size: 24,
          ),
        ),
      );
    }).toList();
  }
}
