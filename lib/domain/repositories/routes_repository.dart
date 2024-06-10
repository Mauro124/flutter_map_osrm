import 'package:flutter_map_osrm/config/error_handlers/app_error.dart';
import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:fpdart/fpdart.dart';

abstract class RoutesRepository {
  Future<Either<AppError, List<MapLocation>>> getRoutesFromLocations(List<MapLocation> locations);
}
