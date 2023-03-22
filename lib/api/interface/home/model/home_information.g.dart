// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeInformation _$HomeInformationFromJson(Map<String, dynamic> json) =>
    HomeInformation(
      json['avatar'] as String,
      json['nameChina'] as String,
      json['nameEnglish'] as String,
      json['router'] as String,
    );

Map<String, dynamic> _$HomeInformationToJson(HomeInformation instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'nameChina': instance.nameChina,
      'nameEnglish': instance.nameEnglish,
      'router': instance.router,
    };
