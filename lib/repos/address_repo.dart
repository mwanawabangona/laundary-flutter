import 'package:dio/dio.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/addres_list_model/addres_list_model.dart';
import 'package:dry_cleaners/offline_data/address_data.dart';
import 'package:dry_cleaners/services/api_service.dart';

abstract class IAddressRepo {
  Future<AddresListModel> getAddresses();
  Future<void> addAddress(Map<String, dynamic> address);
  Future<void> updateAddress(Map<String, dynamic> address, String addressID);
}

class AddressRepo implements IAddressRepo {
  final Dio _dio = getDio();
  @override
  Future<AddresListModel> getAddresses() async {
    final Response response = await _dio.get(
      '/addresses',
    );
    return AddresListModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> addAddress(Map<String, dynamic> address) async {
    await _dio.post('/addresses', data: FormData.fromMap(address));
  }

  @override
  Future<void> updateAddress(
    Map<String, dynamic> address,
    String addressID,
  ) async {
    await _dio.post(
      '/addresses/$addressID',
      data: FormData.fromMap(address),
    );
  }
}

class OfflineAddressRepo implements IAddressRepo {
  @override
  Future<AddresListModel> getAddresses() async {
    await Future.delayed(apiDataDuration);

    return AddresListModel.fromMap(OfflineAddressData.addresslist);
  }

  @override
  Future<void> addAddress(Map<String, dynamic> address) async {
    await Future.delayed(apiDataDuration);

    return;
  }

  @override
  Future<void> updateAddress(
    Map<String, dynamic> address,
    String addressID,
  ) async {
    await Future.delayed(apiDataDuration);

    return;
  }
}
