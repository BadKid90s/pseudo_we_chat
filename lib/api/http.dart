import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pseudo_we_chat/api/api_exception_interceptor.dart';
import 'package:pseudo_we_chat/api/api_mock_interceptor.dart';
import 'package:pseudo_we_chat/config.dart';

class Http {
  /// 单例
  static final Http instance = Http._internal();
  late final Dio dio;
  late final DioAdapter dioAdapter;

  /// 工厂方法
  factory Http() => instance;

  /// 构造函数
  Http._internal() {
    var timeOut = const Duration(microseconds: AppConfig.apiTimeOut);
    BaseOptions options = BaseOptions(
      connectTimeout: timeOut,
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: timeOut,
      // Http请求头.
      headers: {},
      baseUrl: AppConfig.appAPI,
    );
    dio = Dio(options);

    //拦截器
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(ApiExceptionInterceptor());
    //是否开启ApiMock
    if (AppConfig.apiMock) {
      dio.interceptors.add(ApiMockInterceptor());
    }

    dioAdapter = DioAdapter(dio: dio);
  }
}
