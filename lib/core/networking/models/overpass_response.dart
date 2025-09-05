import 'package:json_annotation/json_annotation.dart';

part 'overpass_response.g.dart';

@JsonSerializable()
class OverpassResponse {
  double version;
  String generator;
  @JsonKey(name: "osm3s")
  Osm3S osm3S;
  List<Element> elements;

  OverpassResponse({
    required this.version,
    required this.generator,
    required this.osm3S,
    required this.elements,
  });

  factory OverpassResponse.fromJson(Map<String, dynamic> json) =>
      _$OverpassResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OverpassResponseToJson(this);
}

@JsonSerializable()
class Element {
  String type;
  int id;
  double lat;
  double lon;
  Tags tags;

  Element({
    required this.type,
    required this.id,
    required this.lat,
    required this.lon,
    required this.tags,
  });

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
  Map<String, dynamic> toJson() => _$ElementToJson(this);
}

@JsonSerializable()
class Tags {
  String? amenity;
  @JsonKey(defaultValue: "mosque")
  String? name;
  @JsonKey(name: "name:ar")
  String? nameAr;
  @JsonKey(name: "name:en")
  String? nameEn;
  String? religion;
  String? addrCityEn;
  String? denomination;
  String? level;
  DateTime? checkDate;
  String? addrHousenumber;
  String? addrStreet;

  Tags({
    this.amenity,
    this.name,
    this.nameAr,
    this.nameEn,
    this.religion,
    this.addrCityEn,
    this.denomination,
    this.level,
    this.checkDate,
    this.addrHousenumber,
    this.addrStreet,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable()
class Osm3S {
  @JsonKey(name: "timestamp_osm_base")
  String timestampOsmBase;
  String copyright;

  Osm3S({required this.timestampOsmBase, required this.copyright});

  factory Osm3S.fromJson(Map<String, dynamic> json) => _$Osm3SFromJson(json);
  Map<String, dynamic> toJson() => _$Osm3SToJson(this);
}
