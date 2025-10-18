import 'package:json_annotation/json_annotation.dart';

part 'edition.g.dart';

@JsonSerializable()
class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  dynamic direction;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  @override
  String toString() {
    return 'Edition(identifier: $identifier, language: $language, name: $name, englishName: $englishName, format: $format, type: $type, direction: $direction)';
  }

  factory Edition.fromJson(Map<String, dynamic> json) {
    return _$EditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditionToJson(this);

  Edition copyWith({
    String? identifier,
    String? language,
    String? name,
    String? englishName,
    String? format,
    String? type,
    dynamic direction,
  }) {
    return Edition(
      identifier: identifier ?? this.identifier,
      language: language ?? this.language,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      format: format ?? this.format,
      type: type ?? this.type,
      direction: direction ?? this.direction,
    );
  }
}
