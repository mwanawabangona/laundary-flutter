// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/forgot_password_otp_submit_model/data.dart';
import 'package:dry_cleaners/models/forgot_password_otp_submit_model/forgot_password_otp_submit_model.dart';
import 'package:dry_cleaners/models/login_model/login_model.dart';
import 'package:dry_cleaners/models/register_model/register_model.dart';
import 'package:dry_cleaners/offline_data/login_data.dart';
import 'package:dry_cleaners/services/api_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthRepo {
  Future<LoginModel> login({
    required String contact,
    required String password,
    required String device_key,
  }); //
  Future<void> forgotPassword({required String contact}); //
  Future<void> logout({
    required String device_key,
  });
  Future<RegisterModel> register(Map<String, dynamic> udata); //
  Future<void> resendOTP(String contact);
  Future<void> signUpVerification({
    required String contact,
    required String otp,
  });
  Future<ForgotPasswordOtpSubmitModel> forgotPasswordVerification({
    //
    required String contact,
    required String otp,
  });
  Future<void> resetPassword({
    //
    required String password,
    required String password_confirmation,
    required String token,
  });
  Future<void> addProfilePhoto({required File profile_photo});
}

class AuthRepo extends IAuthRepo {
  final Dio _dio = getDio();

  @override
  Future<LoginModel> login({
    required String contact,
    required String password,
      required String device_key,
    }) async {
    final token = await FirebaseMessaging.instance.getToken();
    String deviceType = 'android';
    if (Platform.isIOS) {
      deviceType = 'ios';
    }
    final Response response = await _dio.post(
      '/login',
      data: FormData.fromMap(
        {
          'contact': contact,
          'password': password,
          'device_key': token,
          'device_type': deviceType
        },
      ),
    );
    return LoginModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> forgotPassword({required String contact}) async {
    final Map<String, dynamic> data = {};
    data["contact"]= contact;
    await _dio.post(
      '/forgot-password',
      data: FormData.fromMap(data),
    );
  }

  @override
  Future<ForgotPasswordOtpSubmitModel> forgotPasswordVerification({
    required String contact,
    required String otp,
  }) async {
    final Response response = await _dio.post(
      '/forgot-password/otp/verify',
      data: FormData.fromMap({'contact': contact, 'otp': otp}),
    );
    return ForgotPasswordOtpSubmitModel.fromMap(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<void> resetPassword({
    required String password,
    required String password_confirmation,
    required String token,
  }) async {
    await _dio.post(
      '/reset-password',
      data: FormData.fromMap({
        'password': password,
        'password_confirmation': password_confirmation,
        'token': token
      }),
    );
  }

  @override
  Future<void> logout({
    required String device_key,
  }) async {
    await _dio.post(
      '/logout',
      data: FormData.fromMap({'device_key': device_key}),
    );
  }

  @override
  Future<void> addProfilePhoto({required File profile_photo}) async {
    final ext = profile_photo.path.split('.').last;
    debugPrint("${DateTime.now().millisecondsSinceEpoch.toString()}.$ext");
    await _dio.post(
      '/users/profile-photo/update',
      data: FormData.fromMap({
        'profile_photo': await MultipartFile.fromFile(
          profile_photo.path,
          filename: "${DateTime.now().millisecondsSinceEpoch.toString()}.$ext",
        ),
      }),
    );
  }

  @override
  Future<RegisterModel> register(Map<String, dynamic> udata) async {
    final Response response = await _dio.post(
      '/register',
      data: FormData.fromMap(udata),
    );

    return RegisterModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> resendOTP(String contact) async {
    await _dio.post(
      '/resend/otp',
      data: FormData.fromMap({
        'contact': contact,
      }),
    );
  }

  @override
  Future<void> signUpVerification({
    required String contact,
    required String otp,
  }) async {
    await _dio.post(
      '/contact/verify',
      data: FormData.fromMap({
        'contact': contact,
        'otp': otp,
      }),
    );
  }
}

class OfflineAuthRepo extends IAuthRepo {
  @override
  Future<LoginModel> login({
    required String contact,
    required String password,
    required String device_key,
  }) async {
    await Future.delayed(apiDataDuration);

    return LoginModel.fromMap(LoginOfflineData.loginData);
  }

  @override
  Future<void> forgotPassword({required String contact}) async {
    await Future.delayed(apiDataDuration);
  }

  @override
  Future<ForgotPasswordOtpSubmitModel> forgotPasswordVerification({
    required String contact,
    required String otp,
  }) async {
    await Future.delayed(apiDataDuration);
    return ForgotPasswordOtpSubmitModel(
      message: 'Success',
      data: Data(token: 'gotToken'),
    );
  }

  @override
  Future<void> resetPassword({
    required String password,
    required String password_confirmation,
    required String token,
  }) async {
    await Future.delayed(apiDataDuration);
  }

  @override
  Future<void> logout({
    required String device_key,
  }) async {
    await Future.delayed(apiDataDuration);
  }

  @override
  Future<void> addProfilePhoto({required File profile_photo}) async {
    await Future.delayed(apiDataDuration);
  }

  @override
  Future<RegisterModel> register(Map<String, dynamic> udata) async {
    await Future.delayed(apiDataDuration);

    return RegisterModel.fromMap(LoginOfflineData.registerData);
  }

  @override
  Future<void> resendOTP(String contact) async {
    await Future.delayed(apiDataDuration);
  }

  @override
  Future<void> signUpVerification({
    required String contact,
    required String otp,
  }) async {
    await Future.delayed(apiDataDuration);
  }
}
