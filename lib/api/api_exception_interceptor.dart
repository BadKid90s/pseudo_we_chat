import 'package:dio/dio.dart';
import 'package:pseudo_we_chat/api/api_mock/api_mock_config.dart';
import 'package:pseudo_we_chat/api/exception.dart';
import 'package:pseudo_we_chat/api/resp_model.dart';

class ApiExceptionInterceptor extends Interceptor {
  ApiExceptionInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var resp = WeChatRespModel.fromJson(response.data);
    switch (resp.code) {
      case 500:
        throw WeChatServerException(resp.message);
      case 600: // -2
        throw WeChatCommonException(resp.message);
      case 403: // -2
        throw WeChatValidateException(resp.message);
      default:
        throw WeChatException(-1, "未知的异常");
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 其他DioError, 一般都是网络问题
    throw WeChatException(-1, err.toString());
  }
}
