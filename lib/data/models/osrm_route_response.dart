import 'package:flutter_map_osrm/data/models/osrm_leg_response.dart';

class OsrmRouteResponse {
  final List<OsrmLegResponse>? legs;
  final String? weightName;

  OsrmRouteResponse({
    this.legs,
    this.weightName,
  });

  factory OsrmRouteResponse.fromJson(Map<String, dynamic> json) => OsrmRouteResponse(
        legs: List<OsrmLegResponse>.from(json["legs"].map((x) => OsrmLegResponse.fromJson(x)) ?? []),
        weightName: json["weight_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "legs": List<dynamic>.from(legs?.map((x) => x.toJson()) ?? []),
        "weight_name": weightName,
      };
}
