import 'package:dio/dio.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/master_model/master_model.dart';
import 'package:dry_cleaners/models/terms_of_service_model/terms_of_service_model.dart';
import 'package:dry_cleaners/offline_data/settings_data.dart';
import 'package:dry_cleaners/services/api_service.dart';

abstract class ISettingsRepo {
  Future<TermsOfServiceModel> getTOS();
  Future<TermsOfServiceModel> getAboutUs();
  Future<TermsOfServiceModel> getPrivacyPolicy();
  Future<TermsOfServiceModel> getContactUS();
  Future<MasterModel> getMasterData();
}

class SettingsRepo implements ISettingsRepo {
  final Dio _dio = getDio();
  @override
  Future<TermsOfServiceModel> getTOS() async {
    final Response reponse = await _dio.get('/legal-pages/trams-of-service');
    return TermsOfServiceModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<TermsOfServiceModel> getAboutUs() async {
    final Response reponse = await _dio.get('/legal-pages/about-us');
    return TermsOfServiceModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<TermsOfServiceModel> getPrivacyPolicy() async {
    final Response reponse = await _dio.get('/legal-pages/privacy-policy');
    return TermsOfServiceModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<TermsOfServiceModel> getContactUS() async {
    final Response reponse = await _dio.get('/legal-pages/contact-us');
    return TermsOfServiceModel.fromMap(reponse.data as Map<String, dynamic>);
  }

  @override
  Future<MasterModel> getMasterData() async {
    final Response reponse = await _dio.get('/master');
    return MasterModel.fromMap(reponse.data as Map<String, dynamic>);
  }
}

class OfflineSettingsRepo implements ISettingsRepo {
  @override
  Future<TermsOfServiceModel> getTOS() async {
    await Future.delayed(apiDataDuration);
    return TermsOfServiceModel.fromMap(OfflineSettingsData.tosData);
  }

  @override
  Future<TermsOfServiceModel> getAboutUs() async {
    await Future.delayed(apiDataDuration);
    return TermsOfServiceModel.fromMap(OfflineSettingsData.aboutUSData);
  }

  @override
  Future<TermsOfServiceModel> getPrivacyPolicy() async {
    await Future.delayed(apiDataDuration);
    return TermsOfServiceModel.fromMap(OfflineSettingsData.privacyData);
  }

  @override
  Future<TermsOfServiceModel> getContactUS() async {
    await Future.delayed(apiDataDuration);
    return TermsOfServiceModel.fromMap(OfflineSettingsData.contactUSData);
  }

  @override
  Future<MasterModel> getMasterData() async {
    await Future.delayed(apiDataDuration);
    return MasterModel.fromMap(OfflineSettingsData.masterData);
  }
}
