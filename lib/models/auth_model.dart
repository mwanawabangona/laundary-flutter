// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

//Authorization model
class AuthModel {
  String message;
  AuthDataModel data;
  AuthModel({
    required this.message,
    required this.data,
  });

  AuthModel copyWith({
    String? message,
    AuthDataModel? data,
  }) {
    return AuthModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': data.toMap(),
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      message: map['message'] as String,
      data: AuthDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel && other.message == message && other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class AuthDataModel {
  AuthUserModel user;
  AuthAccessModel access;
  AuthDataModel({
    required this.user,
    required this.access,
  });

  AuthDataModel copyWith({
    AuthUserModel? user,
    AuthAccessModel? access,
  }) {
    return AuthDataModel(
      user: user ?? this.user,
      access: access ?? this.access,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'access': access.toMap(),
    };
  }

  factory AuthDataModel.fromMap(Map<String, dynamic> map) {
    return AuthDataModel(
      user: AuthUserModel.fromMap(map['user'] as Map<String, dynamic>),
      access: AuthAccessModel.fromMap(map['access'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthDataModel.fromJson(String source) =>
      AuthDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthDataModel(user: $user, access: $access)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthDataModel &&
        other.user == user &&
        other.access == access;
  }

  @override
  int get hashCode => user.hashCode ^ access.hashCode;
}

// Auth User Class
class AuthUserModel {
  int id;
  String first_name;
  String last_name;
  String name;
  String email;
  String mobile;
  AuthUserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.name,
    required this.email,
    required this.mobile,
  });

  AuthUserModel copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? name,
    String? email,
    String? mobile,
  }) {
    return AuthUserModel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'name': name,
      'email': email,
      'mobile': mobile,
    };
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      id: map['id'] as int,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUserModel.fromJson(String source) =>
      AuthUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthUserModel(id: $id, first_name: $first_name, last_name: $last_name, name: $name, email: $email, mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthUserModel &&
        other.id == id &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.name == name &&
        other.email == email &&
        other.mobile == mobile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        name.hashCode ^
        email.hashCode ^
        mobile.hashCode;
  }
}

// Auth Access Class
class AuthAccessModel {
  String auth_type;
  String token;
  String expires_at;
  AuthAccessModel({
    required this.auth_type,
    required this.token,
    required this.expires_at,
  });

  AuthAccessModel copyWith({
    String? auth_type,
    String? token,
    String? expires_at,
  }) {
    return AuthAccessModel(
      auth_type: auth_type ?? this.auth_type,
      token: token ?? this.token,
      expires_at: expires_at ?? this.expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auth_type': auth_type,
      'token': token,
      'expires_at': expires_at,
    };
  }

  factory AuthAccessModel.fromMap(Map<String, dynamic> map) {
    return AuthAccessModel(
      auth_type: map['auth_type'] as String,
      token: map['token'] as String,
      expires_at: map['expires_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthAccessModel.fromJson(String source) =>
      AuthAccessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthAccessModel(auth_type: $auth_type, token: $token, expires_at: $expires_at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthAccessModel &&
        other.auth_type == auth_type &&
        other.token == token &&
        other.expires_at == expires_at;
  }

  @override
  int get hashCode => auth_type.hashCode ^ token.hashCode ^ expires_at.hashCode;
}
