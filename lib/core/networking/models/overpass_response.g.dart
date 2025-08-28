// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overpass_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverpassResponse _$OverpassResponseFromJson(Map<String, dynamic> json) =>
    OverpassResponse(
      version: (json['version'] as num).toDouble(),
      generator: json['generator'] as String,
      osm3S: Osm3S.fromJson(json['osm3s'] as Map<String, dynamic>),
      elements: (json['elements'] as List<dynamic>)
          .map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OverpassResponseToJson(OverpassResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'generator': instance.generator,
      'osm3S': instance.osm3S,
      'elements': instance.elements,
    };

Element _$ElementFromJson(Map<String, dynamic> json) => Element(
  type: json['type'] as String,
  id: (json['id'] as num).toInt(),
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  tags: Tags.fromJson(json['tags'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'lat': instance.lat,
  'lon': instance.lon,
  'tags': instance.tags,
};

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
  amenity: json['amenity'] as String?,
  name: json['name'] as String? ?? 'mosque',
  nameAr: json['name:ar'] as String?,
  nameEn: json['name:en'] as String?,
  religion: json['religion'] as String?,
  addrCityEn: json['addrCityEn'] as String?,
  denomination: json['denomination'] as String?,
  level: json['level'] as String?,
  checkDate: json['checkDate'] == null
      ? null
      : DateTime.parse(json['checkDate'] as String),
  addrHousenumber: json['addrHousenumber'] as String?,
  addrStreet: json['addrStreet'] as String?,
);

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
  'amenity': instance.amenity,
  'name': instance.name,
  'name:ar': instance.nameAr,
  'name:en': instance.nameEn,
  'religion': instance.religion,
  'addrCityEn': instance.addrCityEn,
  'denomination': instance.denomination,
  'level': instance.level,
  'checkDate': instance.checkDate?.toIso8601String(),
  'addrHousenumber': instance.addrHousenumber,
  'addrStreet': instance.addrStreet,
};

Osm3S _$Osm3SFromJson(Map<String, dynamic> json) => Osm3S(
  timestampOsmBase: json['timestamp_osm_base'] as String,
  copyright: json['copyright'] as String,
);

Map<String, dynamic> _$Osm3SToJson(Osm3S instance) => <String, dynamic>{
  'timestamp_osm_base': instance.timestampOsmBase,
  'copyright': instance.copyright,
};
