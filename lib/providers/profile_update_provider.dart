import 'package:dry_cleaners/models/profile_info_model/profile_info_model.dart';
import 'package:dry_cleaners/notfiers/profile_notifier.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/profile_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepoProvider = Provider<IProfileRepo>(
  (ref) => ref.watch(isAppLive) ? ProfileRepo() : OfflineProfileRepo(),
);
final profileUpdateProvider =
    StateNotifierProvider<UpdateProfileNotifier, ApiState<String>>((ref) {
  return UpdateProfileNotifier(ref.watch(profileRepoProvider));
});
final profileInfoProvider =
    StateNotifierProvider<ProfileInfoNotifier, ApiState<ProfileInfoModel>>(
        (ref) {
  return ProfileInfoNotifier(ref.watch(profileRepoProvider));
});
