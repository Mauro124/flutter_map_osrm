import 'package:flutter_map_osrm/domain/use_cases/get_routes_from_locations.dart';
import 'package:flutter_map_osrm/providers/repositories_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRoutesFromLocations = Provider.autoDispose<GetRoutesFromLocations>(
  (ref) => GetRoutesFromLocations(ref.read(routesRepositoryProvider)),
);
