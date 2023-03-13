import 'package:json_annotation/json_annotation.dart';

part 'resp_model.g.dart';

@JsonSerializable()
class WeChatRespModel {
  /// 异常id
  int code;

  /// 异常信息
  String? message;

  // region 逻辑异常专有字段
  /// 补充数据
  Map<String, dynamic>? data;

  // endregion
  WeChatRespModel({
    required this.code,
    this.message,
    required this.data,
  });

  factory WeChatRespModel.fromJson(Map<String, dynamic> json) =>
      _$WeChatRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatRespModelToJson(this);
}
