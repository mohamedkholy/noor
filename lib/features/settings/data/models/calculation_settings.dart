import 'package:adhan/adhan.dart';

class CalculationSettings {
  final String calculationMethod;
  final String madhab;

  const CalculationSettings({
    required this.calculationMethod,
    required this.madhab,
  });

  factory CalculationSettings.fromJson(Map<String, dynamic> json) {
    return CalculationSettings(
      calculationMethod: json['calculationMethod'] as String,
      madhab: json['madhab'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'calculationMethod': calculationMethod,
    'madhab': madhab,
  };

  static const CalculationSettings defaultSettings = CalculationSettings(
    calculationMethod: 'egyptian',
    madhab: 'shafi',
  );

  CalculationMethod getCalculationMethod() {
    switch (calculationMethod) {
      case 'egyptian':
        return CalculationMethod.egyptian;
      case 'umm_al_qura':
        return CalculationMethod.umm_al_qura;
      case 'karachi':
        return CalculationMethod.karachi;
      case 'north_america':
        return CalculationMethod.north_america;
      case 'muslim_world_league':
        return CalculationMethod.muslim_world_league;
      case 'dubai':
        return CalculationMethod.dubai;
      case 'qatar':
        return CalculationMethod.qatar;
      case 'kuwait':
        return CalculationMethod.kuwait;
      case 'singapore':
        return CalculationMethod.singapore;
      default:
        return CalculationMethod.egyptian;
    }
  }

  Madhab getMadhab() {
    switch (madhab) {
      case 'shafi':
        return Madhab.shafi;
      case 'hanafi':
        return Madhab.hanafi;
      default:
        return Madhab.shafi;
    }
  }
}
