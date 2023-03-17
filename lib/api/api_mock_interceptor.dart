import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/api/api_mock/api_mock_config.dart';

class ApiMockInterceptor extends Interceptor {
  ApiMockInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final mockCallback = ApiMockConfig.mockMap[options.path];
    if (mockCallback != null) {
      debugPrint('╔╣ Mock   ║  Success  ║ ${options.path}');
      debugPrint('║  ${options.uri}');
      debugPrint('╚══════════════════════════════════════════════════════════════════════════════════════════╝');
      mockCallback();
    } else {
      debugPrint('╔╣   Mock  ║  Failed  ║ ${options.path}');
      debugPrint('║  ${options.uri}');
      debugPrint('╚══════════════════════════════════════════════════════════════════════════════════════════╝');
    }
    super.onRequest(options, handler);
  }
}
