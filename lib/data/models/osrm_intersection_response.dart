class OsrmIntersectionResponse {
  final int? out;
  final List<bool>? entry;
  final List<int>? bearings;
  final List<double>? location;
  final int? intersectionIn;

  OsrmIntersectionResponse({
    this.out,
    this.entry,
    this.bearings,
    this.location,
    this.intersectionIn,
  });

  factory OsrmIntersectionResponse.fromJson(Map<String, dynamic> json) => OsrmIntersectionResponse(
        out: json["out"] ?? 0,
        entry: List<bool>.from(json["entry"].map((x) => x) ?? []),
        bearings: List<int>.from(json["bearings"].map((x) => x) ?? []),
        location: List<double>.from(json["location"].map((x) => x?.toDouble()) ?? []),
        intersectionIn: json["in"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "out": out ?? 0,
        "entry": List<dynamic>.from(entry?.map((x) => x) ?? []),
        "bearings": List<dynamic>.from(bearings?.map((x) => x) ?? []),
        "location": List<dynamic>.from(location?.map((x) => x) ?? []),
        "in": intersectionIn,
      };
}
