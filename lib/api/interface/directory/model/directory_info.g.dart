// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryInfo _$DirectoryInfoFromJson(Map<String, dynamic> json) =>
    DirectoryInfo(
      json['id'] as int,
      json['avatar'] as String,
      json['name'] as String,
      json['remarks'] as String,
      json['initial'] as String,
    );

Map<String, dynamic> _$DirectoryInfoToJson(DirectoryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'remarks': instance.remarks,
      'initial': instance.initial,
    };
