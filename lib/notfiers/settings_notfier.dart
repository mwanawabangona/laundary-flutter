import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/models/master_model/master_model.dart';
import 'package:dry_cleaners/models/terms_of_service_model/terms_of_service_model.dart';
import 'package:dry_cleaners/repos/settings_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MasterDataNotifier extends StateNotifier<ApiState<MasterModel>> {
  MasterDataNotifier(this.repo) : super(const ApiState.initial()) {
    getMasterData();
  }

  final ISettingsRepo repo;

  Future<void> getMasterData() async {
    state = const ApiState.loading();
    final Box settingsBox = Hive.box(AppHSC.appSettingsBox);
    try {
      final MasterModel data = await repo.getMasterData();

      settingsBox.putAll(data.data!.toMap());

      state = ApiState.loaded(
        data: data,
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class TermsOfServiceNotifier
    extends StateNotifier<ApiState<TermsOfServiceModel>> {
  TermsOfServiceNotifier(this.repo) : super(const ApiState.initial()) {
    getTOS();
  }

  final ISettingsRepo repo;

  Future<void> getTOS() async {
    state = const ApiState.loading();

    try {
      final TermsOfServiceModel data = await repo.getTOS();

      state = ApiState.loaded(
        data: data,
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class PrivacyPolicyNotifier
    extends StateNotifier<ApiState<TermsOfServiceModel>> {
  PrivacyPolicyNotifier(this.repo) : super(const ApiState.initial()) {
    getPrivacyPolicy();
  }

  final ISettingsRepo repo;

  Future<void> getPrivacyPolicy() async {
    state = const ApiState.loading();

    try {
      final TermsOfServiceModel data = await repo.getPrivacyPolicy();

      state = ApiState.loaded(
        data: data,
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class AboutUsNotifier extends StateNotifier<ApiState<TermsOfServiceModel>> {
  AboutUsNotifier(this.repo) : super(const ApiState.initial()) {
    getAboutUs();
  }

  final ISettingsRepo repo;

  Future<void> getAboutUs() async {
    state = const ApiState.loading();

    try {
      final TermsOfServiceModel data = await repo.getAboutUs();

      state = ApiState.loaded(
        data: data,
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}
