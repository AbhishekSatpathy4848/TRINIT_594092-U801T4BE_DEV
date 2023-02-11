// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'philanthropist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhilanthropistModel _$PhilanthropistModelFromJson(Map<String, dynamic> json) =>
    PhilanthropistModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      preferredAreaofimpact: (json['preferredAreaofimpact'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followingNgo: (json['followingNgo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      city: json['city'] as String?,
      state: json['state'] as String?,
      communities: (json['communities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      firstTimeLogin: json['firstTimeLogin'] as bool?,
    );

Map<String, dynamic> _$PhilanthropistModelToJson(
        PhilanthropistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'profilePhoto': instance.profilePhoto,
      'preferredAreaofimpact': instance.preferredAreaofimpact,
      'followingNgo': instance.followingNgo,
      'city': instance.city,
      'state': instance.state,
      'communities': instance.communities,
      'description': instance.description,
      'firstTimeLogin': instance.firstTimeLogin,
    };
