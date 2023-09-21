import 'package:dry_cleaners/models/all_service_model/all_service_model.dart';
import 'package:dry_cleaners/models/products_model/products_model.dart';
import 'package:dry_cleaners/models/promotions_model/promotions_model.dart';
import 'package:dry_cleaners/models/variations_model/variations_model.dart';
import 'package:dry_cleaners/notfiers/guest_notfiers.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/guest_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guestRepoProvider = Provider<IGuestRepo>((ref) {
  return ref.watch(isAppLive) ? GuestRepo() : OfflineGuestRepo();
});

//
//Gets All Promotional Banners
final allPromotionsProvider =
    StateNotifierProvider<AllPromotionsNotifier, ApiState<PromotionsModel>>(
        (ref) {
  return AllPromotionsNotifier(ref.watch(guestRepoProvider));
});
//
//Gets All Services
final allServicesProvider =
    StateNotifierProvider<AllServicerNotifier, ApiState<AllServiceModel>>(
        (ref) {
  return AllServicerNotifier(ref.watch(guestRepoProvider));
});
//
//Gets All Service Variations
final servicesVariationsProvider = StateNotifierProvider.family<
    ServiceVariationsNotifier, ApiState<VariationsModel>, String>((ref, id) {
  return ServiceVariationsNotifier(ref.watch(guestRepoProvider), id);
});
//
//Gets All Products
final productsProvider = StateNotifierProvider.autoDispose<ProductsNotifier,
    ApiState<ProductsModel>>((ref) {
  return ProductsNotifier(
    ref.watch(guestRepoProvider),
    ref.watch(productsFilterProvider),
  );
});
//
//Gets All Products
final productsFilterProvider =
    StateProvider<ProducServiceVariavtionDataModel>((ref) {
  return ProducServiceVariavtionDataModel(servieID: '', variationID: '');
});
