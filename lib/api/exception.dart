/// 异常
class WeChatException implements Exception {
  /// 异常code
  int code;

  /// 异常信息
  String message;

  WeChatException(this.code, this.message);

  @override
  String toString() {
    return "异常: { code: $code, message: $message }";
  }
}

/// 运行时异常
/// 发现时立即修复
class WeChatServerException extends WeChatException {
  WeChatServerException(String? message) : super(-1, message ?? "服务端异常");
}

/// 通用异常
/// 可以直接显示
class WeChatCommonException extends WeChatException {
  WeChatCommonException(String? message) : super(-2, message ?? "");
}

/// 权限异常
class WeChatAccessDeniedException extends WeChatException {
  WeChatAccessDeniedException() : super(-3, "权限不足");
}

/// 参数异常
class WeChatValidateException extends WeChatException {
  WeChatValidateException(String? message) : super(-4, message ?? "参数校验失败");
}
