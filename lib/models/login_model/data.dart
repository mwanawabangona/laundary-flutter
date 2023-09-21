import 'dart:convert';

import 'package:dry_cleaners/models/login_model/access.dart';
import 'package:dry_cleaners/models/login_model/user.dart';

class Data {
  User? user;
  Access? access;

  Data({this.user, this.access});

  @override
  String toString() => 'Data(user: $user, access: $access)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        access: data['access'] == null
            ? null
            : Access.fromMap(data['access'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'access': access?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
