// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as int,
    email: json['email'] as String,
    profileName: json['profile_name'] as String,
    profilePhotoUrl: json['profile_photo_url'] as String,
    role: json['role'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile_name': instance.profileName,
      'profile_photo_url': instance.profilePhotoUrl,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
