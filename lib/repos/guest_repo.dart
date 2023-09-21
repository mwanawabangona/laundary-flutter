import 'package:dio/dio.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/all_service_model/all_service_model.dart';
import 'package:dry_cleaners/models/products_model/products_model.dart';
import 'package:dry_cleaners/models/promotions_model/promotions_model.dart';
import 'package:dry_cleaners/models/variations_model/variations_model.dart';
import 'package:dry_cleaners/offline_data/guest_data.dart';
import 'package:dry_cleaners/offline_data/products_data.dart';
import 'package:dry_cleaners/services/api_service.dart';

abstract class IGuestRepo {
  Future<PromotionsModel> getPromotions();
  Future<AllServiceModel> getServices();
  Future<VariationsModel> getVariations(String id);
  Future<ProductsModel> getProducts(String servieID, String variationID);
}

class GuestRepo implements IGuestRepo {
  final Dio _dio = getDio();
  @override
  Future<PromotionsModel> getPromotions() async {
    final Response reponse = await _dio.get('/promotions');
    return PromotionsModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<AllServiceModel> getServices() async {
    final Response reponse = await _dio.get('/services');
    return AllServiceModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<VariationsModel> getVariations(String id) async {
    final Response reponse = await _dio.get('/variants?service_id=$id');
    return VariationsModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<ProductsModel> getProducts(String servieID, String variationID) async {
    final Response reponse = await _dio
        .get('/products?service_id=$servieID&variant_id=$variationID&search=');
    return ProductsModel.fromMap(reponse.data as Map<String, dynamic>);
  }
}

class OfflineGuestRepo implements IGuestRepo {
  @override
  Future<PromotionsModel> getPromotions() async {
    await Future.delayed(apiDataDuration);
    return PromotionsModel.fromMap(OfflineGuestData.promotionsData);
  }

  @override
  Future<AllServiceModel> getServices() async {
    await Future.delayed(apiDataDuration);
    return AllServiceModel.fromMap(OfflineGuestData.servicesData);
  }

  @override
  Future<VariationsModel> getVariations(String id) async {
    await Future.delayed(apiDataDuration);
    return VariationsModel.fromMap(OfflineGuestData.variationData);
  }

  @override
  Future<ProductsModel> getProducts(String servieID, String variationID) async {
    await Future.delayed(apiDataDuration);
    return ProductsModel.fromMap(ProductsDat.allProducts);
  }
}
