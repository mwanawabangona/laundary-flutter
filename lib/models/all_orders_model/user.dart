import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  dynamic email;
  String? mobile;
  dynamic gender;
  DateTime? mobileVerifiedAt;
  bool? isActive;
  dynamic alternativePhone;
  String? profilePhotoPath;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.mobile,
    this.gender,
    this.mobileVerifiedAt,
    this.isActive,
    this.alternativePhone,
    this.profilePhotoPath,
  });

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, name: $name, email: $email, mobile: $mobile, gender: $gender, mobileVerifiedAt: $mobileVerifiedAt, isActive: $isActive, alternativePhone: $alternativePhone, profilePhotoPath: $profilePhotoPath)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        name: data['name'] as String?,
        email: data['email'] as dynamic,
        mobile: data['mobile'] as String?,
        gender: data['gender'] as dynamic,
        mobileVerifiedAt: data['mobile_verified_at'] == null
            ? null
            : DateTime.parse(data['mobile_verified_at'] as String),
        isActive: data['is_active'] as bool?,
        alternativePhone: data['alternative_phone'] as dynamic,
        profilePhotoPath: data['profile_photo_path'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'name': name,
        'email': email,
        'mobile': mobile,
        'gender': gender,
        'mobile_verified_at': mobileVerifiedAt?.toIso8601String(),
        'is_active': isActive,
        'alternative_phone': alternativePhone,
        'profile_photo_path': profilePhotoPath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? name,
    dynamic email,
    String? mobile,
    dynamic gender,
    DateTime? mobileVerifiedAt,
    bool? isActive,
    dynamic alternativePhone,
    String? profilePhotoPath,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      mobileVerifiedAt: mobileVerifiedAt ?? this.mobileVerifiedAt,
      isActive: isActive ?? this.isActive,
      alternativePhone: alternativePhone ?? this.alternativePhone,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      name.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      gender.hashCode ^
      mobileVerifiedAt.hashCode ^
      isActive.hashCode ^
      alternativePhone.hashCode ^
      profilePhotoPath.hashCode;
}
