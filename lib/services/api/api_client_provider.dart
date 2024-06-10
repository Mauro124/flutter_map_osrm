import 'package:flutter_map_osrm/services/api/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<APIClient>((ref) {
  return APIClient(baseUrl: 'https://router.project-osrm.org');
});
