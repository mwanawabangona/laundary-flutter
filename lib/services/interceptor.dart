import 'package:dio/dio.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ElTanvirInterceptors extends Interceptor {
  Box? authBox;
  Box? userBox;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //IF We are Making Back ground Request then we need This
    // try {
    //   await Hive.initFlutter();
    // } catch (e) {
    //   print(e);
    // }
    // authBox = await Hive.openBox(HiveConstants.authBox);
    // userBox = await Hive.openBox(HiveConstants.userBox);

    //Else this Block Because these box opens when app opens
    authBox = Hive.box(AppHSC.authBox);

    if (authBox!.get(AppHSC.authToken) != null &&
        authBox!.get(AppHSC.authToken) != '') {
      final String token = authBox!.get(AppHSC.authToken) as String;
      final String tokenType = authBox!.get(AppHSC.authTokenType) as String;
      options.headers['Authorization'] = "$tokenType $token";
    }
    options.headers['Accept'] = "application/json";
    options.headers['accept'] = "application/json";

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      debugPrint('Got Response');

      // authBox!.clear();

      // ContextLess.nav.pushReplacementNamed(Routes.login);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      authBox!.clear();
      userBox!.clear();

      ContextLess.nav.pushNamed(Routes.loginScreen);
    }
    return super.onError(err, handler);
  }
}
