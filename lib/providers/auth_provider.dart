import 'package:dry_cleaners/models/forgot_password_otp_submit_model/forgot_password_otp_submit_model.dart';
import 'package:dry_cleaners/models/login_model/login_model.dart';
import 'package:dry_cleaners/models/register_model/register_model.dart';
import 'package:dry_cleaners/notfiers/auth_notifiers.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/auth_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<IAuthRepo>((ref) {
  return ref.watch(isAppLive) ? AuthRepo() : OfflineAuthRepo();
});

//
//Login
final loginProvider =
    StateNotifierProvider<LoginNotifier, ApiState<LoginModel>>((ref) {
  return LoginNotifier(
    ref.watch(authRepoProvider),
    ref.watch(onesignalDeviceIDProvider),
  );
});

//
//forgot password
final forgotPassProvider =
    StateNotifierProvider<ForgotPassNotifier, ApiState<String>>((ref) {
  return ForgotPassNotifier(ref.watch(authRepoProvider));
});

//
//forgot password Timer
final forgotPassTimerProvider =
    StateNotifierProvider<ForgotPassTimerNotifier, int>((ref) {
  return ForgotPassTimerNotifier();
});
//
//forgot password Otp Verification
final forgotPassOtpVerificationProvider = StateNotifierProvider<
    ForgotPassOtpVerficationNotifier,
    ApiState<ForgotPasswordOtpSubmitModel>>((ref) {
  return ForgotPassOtpVerficationNotifier(ref.watch(authRepoProvider));
});
//
//forgot password Otp Verification
final forgotPassResetPassProvider =
    StateNotifierProvider<ForgotPassResetPassNotifier, ApiState<String>>((ref) {
  return ForgotPassResetPassNotifier(ref.watch(authRepoProvider));
});

//Log Out
final logOutProvider =
    StateNotifierProvider<LogoutNotifier, ApiState<String>>((ref) {
  return LogoutNotifier(
    ref.watch(authRepoProvider),
    ref.watch(onesignalDeviceIDProvider),
  );
});

//
//Registration
final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, ApiState<RegisterModel>>((ref) {
  return RegistrationNotifier(ref.watch(authRepoProvider));
});
//
//Registration
final registrationResendOtpProvider =
    StateNotifierProvider<RegistrationResendOtpNotifier, ApiState<String>>(
        (ref) {
  return RegistrationResendOtpNotifier(ref.watch(authRepoProvider));
});
//
//Registration
final registrationOtpVerifyProvider = StateNotifierProvider<
    RegistrationOtpVerificationNotifier, ApiState<String>>((ref) {
  return RegistrationOtpVerificationNotifier(ref.watch(authRepoProvider));
});
//
//Registration
final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, ApiState<String>>((ref) {
  return ImageUploadNotifier(ref.watch(authRepoProvider));
});
