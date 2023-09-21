import 'dart:convert';

class Schedule {
  String? hour;
  String? title;

  Schedule({this.hour, this.title});

  factory Schedule.fromMap(Map<String, dynamic> data) => Schedule(
        hour: data['hour'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'hour': hour,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Schedule].
  factory Schedule.fromJson(String data) {
    return Schedule.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Schedule] to a JSON string.
  String toJson() => json.encode(toMap());

  Schedule copyWith({
    String? hour,
    String? title,
  }) {
    return Schedule(
      hour: hour ?? this.hour,
      title: title ?? this.title,
    );
  }
}
