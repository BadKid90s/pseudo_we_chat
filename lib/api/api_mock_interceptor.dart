import 'package:dio/dio.dart';
import 'package:pseudo_we_chat/api/api_mock/api_mock_config.dart';

class ApiMockInterceptor extends Interceptor {
  ApiMockInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final mockCallback = ApiMockConfig.mockMap[options.path];
    if (mockCallback != null) {
      print('╔╣   Mock  ║  Success  ║ ${options.path}');
      print('║  ${options.uri}');
      print(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
      mockCallback();
    } else {
      print('╔╣   Mock  ║  Failed  ║ ${options.path}');
      print('║  ${options.uri}');
      print(
          '╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }
    super.onRequest(options, handler);
  }
}
