import 'package:dio/dio.dart';

class Http {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static late Http instance;
  static late Dio dio;

  factory Http() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(microseconds: CONNECT_TIMEOUT),
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: const Duration(microseconds: RECEIVE_TIMEOUT),
      // Http请求头.
      headers: {},
    );
    dio = Dio(options);
    return instance;
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init(
      {required String baseUrl,
      required int connectTimeout,
      required int receiveTimeout,
      required List<Interceptor> interceptors}) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: Duration(microseconds: connectTimeout),
      receiveTimeout: Duration(microseconds: receiveTimeout),
    );
    if (interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  static dynamic get(String path, {Map<String, dynamic>? queryParameters}) {
    return Http.dio
        .get(path, queryParameters: queryParameters)
        .then((value) => value.extra);
  }
}
