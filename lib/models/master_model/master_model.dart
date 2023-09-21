import 'dart:convert';

import 'package:dry_cleaners/models/master_model/data.dart';

class MasterModel {
  Data? data;

  MasterModel({this.data});

  @override
  String toString() => 'MasterModel(data: $data)';

  factory MasterModel.fromMap(Map<String, dynamic> data) => MasterModel(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MasterModel].
  factory MasterModel.fromJson(String data) {
    return MasterModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MasterModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
