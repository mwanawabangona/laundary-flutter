import 'dart:convert';

import 'package:dry_cleaners/models/post_codes_model/result.dart';

class Datum {
  List<Result>? result;
  int? code;
  String? message;
  int? limit;
  int? page;
  int? total;

  Datum({
    this.result,
    this.code,
    this.message,
    this.limit,
    this.page,
    this.total,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        result: (data['result'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
        code: data['code'] as int?,
        message: data['message'] as String?,
        limit: data['limit'] as int?,
        page: data['page'] as int?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'result': result?.map((e) => e.toMap()).toList(),
        'code': code,
        'message': message,
        'limit': limit,
        'page': page,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    List<Result>? result,
    int? code,
    String? message,
    int? limit,
    int? page,
    int? total,
  }) {
    return Datum(
      result: result ?? this.result,
      code: code ?? this.code,
      message: message ?? this.message,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      total: total ?? this.total,
    );
  }
}
