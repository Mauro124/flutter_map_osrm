import 'package:flutter_map_osrm/data/models/osrm_intersection_response.dart';
import 'package:flutter_map_osrm/data/models/osrm_maneuver_response.dart';

class OsrmStepResponse {
  final String? geometry;

  OsrmStepResponse({
    this.geometry,
  });

  factory OsrmStepResponse.fromJson(Map<String, dynamic> json) => OsrmStepResponse(
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry,
      };
}
