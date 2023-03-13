// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginStatus _$LoginStatusFromJson(Map<String, dynamic> json) => LoginStatus(
      json['status'] as bool,
      json['message'] as String?,
    );

Map<String, dynamic> _$LoginStatusToJson(LoginStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
