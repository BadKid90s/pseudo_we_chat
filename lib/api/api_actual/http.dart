import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pseudo_we_chat/api/exception.dart';

import '../resp_model.dart';

class Http {
  ///超时时间
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const String baseUrl = "30000";
  static List<Interceptor> interceptors = [PrettyDioLogger()];

  static late Http instance;
  static late Dio _dio;

  factory Http() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(microseconds: connectTimeout),
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: const Duration(microseconds: receiveTimeout),
      // Http请求头.
      headers: {},
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
    _dio.interceptors.addAll(interceptors);

    return instance;
  }

  Future<dynamic> _request(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var result = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data;
    } on DioError catch (e) {
      try {
        var resp = WeChatRespModel.fromJson(e.response?.data);
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
      } catch (e) {
        // 其他DioError, 一般都是网络问题
        throw WeChatException(-1, e.toString());
      }
    } catch (e) {
      throw WeChatException(-1, e.toString());
    }
  }
}
