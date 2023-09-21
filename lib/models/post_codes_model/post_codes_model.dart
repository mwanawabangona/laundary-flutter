import 'dart:convert';

import 'package:dry_cleaners/models/post_codes_model/datum.dart';

class PostCodesModel {
  String? message;
  List<Datum>? data;

  PostCodesModel({this.message, this.data});

  factory PostCodesModel.fromMap(Map<String, dynamic> data) {
    return PostCodesModel(
      message: data['message'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostCodesModel].
  factory PostCodesModel.fromJson(String data) {
    return PostCodesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostCodesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PostCodesModel copyWith({
    String? message,
    List<Datum>? data,
  }) {
    return PostCodesModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
