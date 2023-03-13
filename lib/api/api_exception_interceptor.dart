import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
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
      case 600:
        get_x.Get.defaultDialog(
          title: "Error❕",
          middleText: resp.message ?? "后端未知错误",
        );
        break;
      case 403: // -2
        throw WeChatValidateException(resp.message);
      default:
        response.data = resp.data;
        super.onResponse(response,handler);
        break;
    }

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err is! WeChatException) {
      // 其他DioError, 一般都是网络问题
      throw WeChatException(-1, err.toString());
    }
  }
}
