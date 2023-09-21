import 'dart:convert';

import 'package:dry_cleaners/models/forgot_password_otp_submit_model/data.dart';

class ForgotPasswordOtpSubmitModel {
  String? message;
  Data? data;

  ForgotPasswordOtpSubmitModel({this.message, this.data});

  @override
  String toString() {
    return 'ForgotPasswordOtpSubmitModel(message: $message, data: $data)';
  }

  factory ForgotPasswordOtpSubmitModel.fromMap(Map<String, dynamic> data) {
    return ForgotPasswordOtpSubmitModel(
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
  /// Parses the string and returns the resulting Json object as [ForgotPasswordOtpSubmitModel].
  factory ForgotPasswordOtpSubmitModel.fromJson(String data) {
    return ForgotPasswordOtpSubmitModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ForgotPasswordOtpSubmitModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
