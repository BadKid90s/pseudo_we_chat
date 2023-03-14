// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeChatRespModel _$WeChatRespModelFromJson(Map<String, dynamic> json) =>
    WeChatRespModel(
      code: json['code'] as int,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$WeChatRespModelToJson(WeChatRespModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
