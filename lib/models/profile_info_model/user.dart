import 'dart:convert';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
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

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
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
}
