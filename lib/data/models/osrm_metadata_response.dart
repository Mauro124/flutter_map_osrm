class OsrmMetadataResponse {
  final List<String> datasourceNames;

  OsrmMetadataResponse({
    required this.datasourceNames,
  });

  factory OsrmMetadataResponse.fromJson(Map<String, dynamic> json) => OsrmMetadataResponse(
        datasourceNames: List<String>.from(json["datasource_names"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "datasource_names": List<dynamic>.from(datasourceNames.map((x) => x)),
      };
}
