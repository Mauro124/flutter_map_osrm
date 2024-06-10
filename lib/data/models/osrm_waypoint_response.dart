class OsrmWaypointResponse {
  final String hint;
  final double distance;
  final String name;
  final List<double> location;

  OsrmWaypointResponse({
    required this.hint,
    required this.distance,
    required this.name,
    required this.location,
  });

  factory OsrmWaypointResponse.fromJson(Map<String, dynamic> json) => OsrmWaypointResponse(
        hint: json["hint"],
        distance: json["distance"]?.toDouble() ?? 0.0,
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble() ?? 0.0)),
      );

  Map<String, dynamic> toJson() => {
        "hint": hint,
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}
