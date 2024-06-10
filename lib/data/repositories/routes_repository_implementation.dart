import 'package:flutter_map_osrm/config/error_handlers/app_error.dart';
import 'package:flutter_map_osrm/data/models/osrm_leg_response.dart';
import 'package:flutter_map_osrm/data/models/osrm_response.dart';
import 'package:flutter_map_osrm/data/models/osrm_step_response.dart';
import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:flutter_map_osrm/domain/repositories/routes_repository.dart';
import 'package:flutter_map_osrm/services/api/api_client.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fpdart/fpdart.dart';

class RoutesRepositoryImplementation implements RoutesRepository {
  final APIClient apiClient;

  RoutesRepositoryImplementation({required this.apiClient});

  @override
  Future<Either<AppError, List<MapLocation>>> getRoutesFromLocations(List<MapLocation> locations) async {
    final locationsString = locations.map((e) => '${e.longitude},${e.latitude}').join(';');
    final path = '/route/v1/driving/$locationsString?annotations=true&steps=true';

    final response = await apiClient.sendGet(path);
    OsrmResponse osrmResponse = response.fold(
      (l) => throw Exception(l),
      (r) => OsrmResponse.fromJson(r),
    );

    List<OsrmLegResponse>? legs = osrmResponse.routes.expand((e) => e.legs as List<OsrmLegResponse>).toList();
    List<OsrmStepResponse>? steps = legs.expand((e) => e.steps as List<OsrmStepResponse>).toList();
    List<String?>? geometries = steps.map((e) => e.geometry).toList();
    PolylinePoints polylinePoints = PolylinePoints();
    List<List<PointLatLng>> points = [];

    for (var element in geometries) {
      List<PointLatLng> result = polylinePoints.decodePolyline(element!);
      points.add(result);
    }

    List<MapLocation> mapLocations =
        points.expand((e) => e).map((e) => MapLocation(latitude: e.latitude, longitude: e.longitude)).toList();

    print('mapLocations: ${mapLocations.map((e) => e.toMap()).toList()}');
    return Right(mapLocations);
  }
}
