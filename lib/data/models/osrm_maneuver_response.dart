class OsrmManeuverResponse {
  final int? bearingAfter;
  final int? bearingBefore;
  final List<double>? location;
  final String? type;

  OsrmManeuverResponse({
    this.bearingAfter,
    this.bearingBefore,
    this.location,
    this.type,
  });

  factory OsrmManeuverResponse.fromJson(Map<String, dynamic> json) => OsrmManeuverResponse(
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": List<dynamic>.from(location?.map((x) => x) ?? []),
        "type": type,
      };
}
