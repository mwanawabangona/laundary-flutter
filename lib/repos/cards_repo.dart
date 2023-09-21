import 'package:dio/dio.dart';
import 'package:dry_cleaners/models/carde_save_model/carde_save_model.dart';
import 'package:dry_cleaners/models/saved_cards_model/saved_cards_model.dart';
import 'package:dry_cleaners/services/api_service.dart';

abstract class ICardsRepo {
  Future<SavedCardsModel> getCards();
  Future<CardeSaveModel> saveCard({
    required Map<String, dynamic> data,
  });
}

class CardsRepo implements ICardsRepo {
  final Dio _dio = getDio();
  @override
  Future<SavedCardsModel> getCards() async {
    final Response response = await _dio.get(
      '/card-list',
    );
    return SavedCardsModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<CardeSaveModel> saveCard({
    required Map<String, dynamic> data,
  }) async {
    final Response response = await _dio.post(
      '/cards',
      data: FormData.fromMap(
        data,
      ),
    );
    return CardeSaveModel.fromMap(response.data as Map<String, dynamic>);
  }
}
