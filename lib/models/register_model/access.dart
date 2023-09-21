import 'dart:convert';

class Access {
  String? authType;
  String? token;
  String? expiresAt;

  Access({this.authType, this.token, this.expiresAt});

  @override
  String toString() {
    return 'Access(authType: $authType, token: $token, expiresAt: $expiresAt)';
  }

  factory Access.fromMap(Map<String, dynamic> data) => Access(
        authType: data['auth_type'] as String?,
        token: data['token'] as String?,
        expiresAt: data['expires_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'auth_type': authType,
        'token': token,
        'expires_at': expiresAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Access].
  factory Access.fromJson(String data) {
    return Access.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Access] to a JSON string.
  String toJson() => json.encode(toMap());
}
