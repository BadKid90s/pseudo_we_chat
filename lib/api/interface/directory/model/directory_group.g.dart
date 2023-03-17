// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryGroup _$DirectoryGroupFromJson(Map<String, dynamic> json) =>
    DirectoryGroup(
      json['name'] as String,
      (json['dataList'] as List<dynamic>)
          .map((e) => DirectoryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DirectoryGroupToJson(DirectoryGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dataList': instance.dataList,
    };
