import 'package:flutter_map_osrm/config/error_handlers/app_error.dart';
import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:flutter_map_osrm/domain/repositories/routes_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetRoutesFromLocations {
  final RoutesRepository _routesRepository;

  GetRoutesFromLocations(this._routesRepository);

  Future<Either<AppError, List<MapLocation>>> call(List<MapLocation> locations) async {
    return _routesRepository.getRoutesFromLocations(locations);
  }
}
