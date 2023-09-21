import 'package:dio/dio.dart';
import 'package:dry_cleaners/models/post_codes_model/post_codes_model.dart';
import 'package:dry_cleaners/services/api_service.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCodeListNotifier extends StateNotifier<ApiState<PostCodesModel>> {
  PostCodeListNotifier(this.query) : super(const ApiState.initial()) {
    getPostCodes();
  }
  final String query;
  final Dio _dio = getDio();
  Future<void> getPostCodes() async {
    state = const ApiState.loading();
    try {
      final response = await _dio.get('/post-code?postcode=$query');
      state = ApiState.loaded(
        data: PostCodesModel.fromMap(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}
