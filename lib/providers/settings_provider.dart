import 'package:dry_cleaners/models/master_model/master_model.dart';
import 'package:dry_cleaners/models/terms_of_service_model/terms_of_service_model.dart';
import 'package:dry_cleaners/notfiers/settings_notfier.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/settings_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsRepoProvider = Provider<ISettingsRepo>((ref) {
  return ref.watch(isAppLive) ? SettingsRepo() : OfflineSettingsRepo();
});

//
//
//
final settingsProvider =
    StateNotifierProvider<MasterDataNotifier, ApiState<MasterModel>>((ref) {
  return MasterDataNotifier(ref.watch(settingsRepoProvider));
});

//
//
//
final tosProvider = StateNotifierProvider<TermsOfServiceNotifier,
    ApiState<TermsOfServiceModel>>((ref) {
  return TermsOfServiceNotifier(ref.watch(settingsRepoProvider));
});
//
//
//
final privacyProvider =
    StateNotifierProvider<PrivacyPolicyNotifier, ApiState<TermsOfServiceModel>>(
        (ref) {
  return PrivacyPolicyNotifier(ref.watch(settingsRepoProvider));
});
//
//
//
final aboutUsProvider =
    StateNotifierProvider<AboutUsNotifier, ApiState<TermsOfServiceModel>>(
        (ref) {
  return AboutUsNotifier(ref.watch(settingsRepoProvider));
});
