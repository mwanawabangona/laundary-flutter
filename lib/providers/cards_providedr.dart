import 'package:dry_cleaners/models/carde_save_model/carde_save_model.dart';
import 'package:dry_cleaners/models/saved_cards_model/saved_cards_model.dart';
import 'package:dry_cleaners/notfiers/cards_notifier.dart';
import 'package:dry_cleaners/repos/cards_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardsRepoProvider = Provider<ICardsRepo>((ref) {
  return CardsRepo();
});
//
//
//
final allCardsProvider =
    StateNotifierProvider<AllCardsNotfier, ApiState<SavedCardsModel>>((ref) {
  return AllCardsNotfier(ref.watch(cardsRepoProvider));
});
//
//
//
final cardSaveProvider =
    StateNotifierProvider<SaveCardNotfier, ApiState<CardeSaveModel>>((ref) {
  return SaveCardNotfier(ref.watch(cardsRepoProvider));
});
