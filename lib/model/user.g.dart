// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['user_id'] as String,
    json['firstname'] as String,
    json['lastname'] as String,
    json['email'] as String,
    json['password'] as String,
    json['s_phone'] as String,
    json['s_address'] as String,
    json['s_city'] as String,
    json['s_state'] as String,
    json['s_country'] as String,
    json['s_zipcode'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
      's_phone': instance.s_phone,
      's_address': instance.s_address,
      's_city': instance.s_city,
      's_state': instance.s_state,
      's_country': instance.s_country,
      's_zipcode': instance.s_zipcode,
    };
