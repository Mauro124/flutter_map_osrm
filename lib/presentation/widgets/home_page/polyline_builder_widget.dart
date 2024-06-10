import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:flutter_map_osrm/presentation/providers/routes_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class PolylineBuilderWidget extends ConsumerWidget {
  final List<MapLocation> locations;

  const PolylineBuilderWidget({super.key, required this.locations});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<MapLocation>>(
      future: ref.read(routesControllerProvider(locations).future),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        List<MapLocation> locations = snapshot.data as List<MapLocation>;

        return Center(
          child: PolylineLayer(
            polylines: [
              Polyline(
                strokeWidth: 3,
                strokeJoin: StrokeJoin.round,
                points: [
                  for (var location in locations) LatLng(location.latitude, location.longitude),
                ],
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
