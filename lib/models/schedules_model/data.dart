import 'dart:convert';

import 'package:dry_cleaners/models/schedules_model/schedule.dart';

class Data {
  List<Schedule>? schedules;

  Data({this.schedules});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        schedules: (data['schedules'] as List<dynamic>?)
            ?.map((e) => Schedule.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'schedules': schedules?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    List<Schedule>? schedules,
  }) {
    return Data(
      schedules: schedules ?? this.schedules,
    );
  }
}
