// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NgoModel _$NgoModelFromJson(Map<String, dynamic> json) => NgoModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      fieldsOfImpact: (json['fieldsOfImpact'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      previousWork: (json['previousWork'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      currentGoals: (json['currentGoals'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      impactOnEnvironment: json['impactOnEnvironment'] as String?,
      followerCount: json['followerCount'] as int?,
      fundingNeeds: json['fundingNeeds'] as int?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      emails:
          (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      community: json['community'] as String?,
      news: (json['news'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mission: json['mission'] as String?,
      firstTimeLogin: json['firstTimeLogin'] as bool?,
    );

Map<String, dynamic> _$NgoModelToJson(NgoModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'profilePhoto': instance.profilePhoto,
      'photos': instance.photos,
      'type': instance.type,
      'fieldsOfImpact': instance.fieldsOfImpact,
      'previousWork': instance.previousWork,
      'currentGoals': instance.currentGoals,
      'impactOnEnvironment': instance.impactOnEnvironment,
      'followerCount': instance.followerCount,
      'fundingNeeds': instance.fundingNeeds,
      'city': instance.city,
      'state': instance.state,
      'phoneNumbers': instance.phoneNumbers,
      'emails': instance.emails,
      'community': instance.community,
      'news': instance.news,
      'mission': instance.mission,
      'firstTimeLogin': instance.firstTimeLogin,
    };
