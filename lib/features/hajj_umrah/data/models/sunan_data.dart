class HajjUmrahData {
  final DateTime date;
  final bool isCompleted;

  const HajjUmrahData({
    required this.date,
    required this.isCompleted,
  });

  factory HajjUmrahData.fromJson(Map<String, dynamic> json) {
    return HajjUmrahData(
      date: DateTime.parse(json['date']),
      isCompleted: json['is_completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'is_completed': isCompleted,
    };
  }
}
