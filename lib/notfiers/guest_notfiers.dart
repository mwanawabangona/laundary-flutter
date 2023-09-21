// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dry_cleaners/models/all_service_model/all_service_model.dart';
import 'package:dry_cleaners/models/products_model/products_model.dart';
import 'package:dry_cleaners/models/promotions_model/promotions_model.dart';
import 'package:dry_cleaners/models/variations_model/variations_model.dart';
import 'package:dry_cleaners/repos/guest_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllPromotionsNotifier extends StateNotifier<ApiState<PromotionsModel>> {
  AllPromotionsNotifier(this.repo) : super(const ApiState.initial()) {
    getAllpromotions();
  }

  final IGuestRepo repo;

  Future<void> getAllpromotions() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await repo.getPromotions(),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class AllServicerNotifier extends StateNotifier<ApiState<AllServiceModel>> {
  AllServicerNotifier(this.repo) : super(const ApiState.initial()) {
    getAllServices();
  }

  final IGuestRepo repo;

  Future<void> getAllServices() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await repo.getServices(),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class ServiceVariationsNotifier
    extends StateNotifier<ApiState<VariationsModel>> {
  ServiceVariationsNotifier(this.repo, this.id)
      : super(const ApiState.initial()) {
    getAllVariations();
  }

  final IGuestRepo repo;
  final String id;

  Future<void> getAllVariations() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await repo.getVariations(id),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class ProductsNotifier extends StateNotifier<ApiState<ProductsModel>> {
  ProductsNotifier(this.repo, this.data) : super(const ApiState.initial()) {
    getAllVariations();
  }

  final IGuestRepo repo;
  final ProducServiceVariavtionDataModel data;

  Future<void> getAllVariations() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await repo.getProducts(data.servieID, data.variationID),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class ProducServiceVariavtionDataModel {
  String servieID;
  String variationID;
  ProducServiceVariavtionDataModel({
    required this.servieID,
    required this.variationID,
  });

  ProducServiceVariavtionDataModel copyWith({
    String? servieID,
    String? variationID,
  }) {
    return ProducServiceVariavtionDataModel(
      servieID: servieID ?? this.servieID,
      variationID: variationID ?? this.variationID,
    );
  }
}
