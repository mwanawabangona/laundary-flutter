import 'package:dry_cleaners/models/addres_list_model/addres_list_model.dart';
import 'package:dry_cleaners/notfiers/address_notifiers.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/address_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addresRepoProvider = Provider<IAddressRepo>((ref) {
  return ref.watch(isAppLive) ? AddressRepo() : OfflineAddressRepo();
});

///
///
///
final addresListProvider =
    StateNotifierProvider<AddressListNotifier, ApiState<AddresListModel>>(
        (ref) {
  return AddressListNotifier(ref.watch(addresRepoProvider));
});

///
///
///
final addAddresProvider =
    StateNotifierProvider<AddAddressNotifier, ApiState<String>>((ref) {
  return AddAddressNotifier(ref.watch(addresRepoProvider));
});

///
///
///
final updateAddresProvider =
    StateNotifierProvider<UpdateAddressNotifier, ApiState<String>>((ref) {
  return UpdateAddressNotifier(ref.watch(addresRepoProvider));
});
