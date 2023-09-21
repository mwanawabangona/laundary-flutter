import 'dart:convert';

import 'package:dry_cleaners/models/terms_of_service_model/setting.dart';

class Data {
  Setting? setting;

  Data({this.setting});

  @override
  String toString() => 'Data(setting: $setting)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        setting: data['setting'] == null
            ? null
            : Setting.fromMap(data['setting'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'setting': setting?.toMap(),
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
    Setting? setting,
  }) {
    return Data(
      setting: setting ?? this.setting,
    );
  }
}
