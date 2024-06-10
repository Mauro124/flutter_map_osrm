import 'package:flutter_map_osrm/data/models/osrm_metadata_response.dart';

class OsrmAnnotationResponse {
  final OsrmMetadataResponse metadata;
  final List<int> datasources;

  OsrmAnnotationResponse({
    required this.metadata,
    required this.datasources,
  });

  factory OsrmAnnotationResponse.fromJson(Map<String, dynamic> json) => OsrmAnnotationResponse(
        metadata: OsrmMetadataResponse.fromJson(json["metadata"]),
        datasources: List<int>.from(json["datasources"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "datasources": List<dynamic>.from(datasources.map((x) => x)),
      };
}
