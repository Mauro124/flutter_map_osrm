import 'package:flutter_map_osrm/domain/entities/map_location.dart';
import 'package:flutter_map_osrm/providers/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routesControllerProvider =
    FutureProvider.autoDispose.family<List<MapLocation>, List<MapLocation>>((ref, locations) async {
  final useCase = ref.read(getRoutesFromLocations);
  final response = await useCase(locations);
  return response.fold(
    (l) => throw l.code.description,
    (r) => r,
  );
});
