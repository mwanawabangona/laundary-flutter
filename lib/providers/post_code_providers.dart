import 'package:dry_cleaners/models/post_codes_model/post_codes_model.dart';
import 'package:dry_cleaners/notfiers/post_code_notifiers.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postCodeQueryProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final postCodeProvider = StateNotifierProvider.autoDispose<PostCodeListNotifier,
    ApiState<PostCodesModel>>((
  ref,
) {
  return PostCodeListNotifier(
    ref.watch(postCodeQueryProvider),
  );
});

final hasPostCodeProvider = StateProvider<bool>((ref) {
  return false;
});
