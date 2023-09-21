import 'dart:convert';

import 'package:dry_cleaners/models/terms_of_service_model/data.dart';

class TermsOfServiceModel {
  String? message;
  Data? data;

  TermsOfServiceModel({this.message, this.data});

  @override
  String toString() => 'TermsOfServiceModel(message: $message, data: $data)';

  factory TermsOfServiceModel.fromMap(Map<String, dynamic> data) {
    return TermsOfServiceModel(
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
  /// Parses the string and returns the resulting Json object as [TermsOfServiceModel].
  factory TermsOfServiceModel.fromJson(String data) {
    return TermsOfServiceModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [TermsOfServiceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TermsOfServiceModel copyWith({
    String? message,
    Data? data,
  }) {
    return TermsOfServiceModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
