import 'package:flutter_map_osrm/data/repositories/routes_repository_implementation.dart';
import 'package:flutter_map_osrm/domain/repositories/routes_repository.dart';
import 'package:flutter_map_osrm/services/api/api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routesRepositoryProvider = Provider<RoutesRepository>(
  (ref) => RoutesRepositoryImplementation(apiClient: ref.read(apiClientProvider)),
);
