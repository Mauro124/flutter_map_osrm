import 'package:flutter_map_osrm/data/models/osrm_annotation_response.dart';
import 'package:flutter_map_osrm/data/models/osrm_step_response.dart';

class OsrmLegResponse {
  final List<OsrmStepResponse>? steps;
  final String? summary;
  final OsrmAnnotationResponse? annotation;

  OsrmLegResponse({
    this.steps,
    this.summary,
    this.annotation,
  });

  factory OsrmLegResponse.fromJson(Map<String, dynamic> json) => OsrmLegResponse(
        steps: List<OsrmStepResponse>.from(json["steps"].map((x) => OsrmStepResponse.fromJson(x)) ?? []),
        summary: json["summary"],
        annotation: OsrmAnnotationResponse.fromJson(json["annotation"]),
      );

  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps?.map((x) => x.toJson()) ?? []),
        "summary": summary,
        "annotation": annotation?.toJson(),
      };
}
