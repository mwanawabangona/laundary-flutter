import 'package:dry_cleaners/models/carde_save_model/carde_save_model.dart';
import 'package:dry_cleaners/models/saved_cards_model/saved_cards_model.dart';
import 'package:dry_cleaners/repos/cards_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCardsNotfier extends StateNotifier<ApiState<SavedCardsModel>> {
  AllCardsNotfier(this._repo) : super(const ApiState.initial()) {
    getCards();
  }
  final ICardsRepo _repo;

  Future<void> getCards() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await _repo.getCards(),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}

class SaveCardNotfier extends StateNotifier<ApiState<CardeSaveModel>> {
  SaveCardNotfier(this._repo) : super(const ApiState.initial());
  final ICardsRepo _repo;

  Future<void> saveCard({
    required Map<String, dynamic> data,
  }) async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await _repo.saveCard(
          data: data,
        ),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}
