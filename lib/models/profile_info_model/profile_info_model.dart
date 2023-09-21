import 'dart:convert';

import 'package:dry_cleaners/models/profile_info_model/data.dart';

class ProfileInfoModel {
  String? message;
  Data? data;

  ProfileInfoModel({this.message, this.data});

  factory ProfileInfoModel.fromMap(Map<String, dynamic> data) {
    return ProfileInfoModel(
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileInfoModel].
  factory ProfileInfoModel.fromJson(String data) {
    return ProfileInfoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileInfoModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
