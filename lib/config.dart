/// 构建配置
///
///   1. dev: 开发
///   2. stage: 内测
///   3. prod: 生产
class AppConfig {
  /// 应用程序类型
  static const appType = String.fromEnvironment(
    'APP_TYPE',
    defaultValue: 'dev',
  );

  /// 应用程序类型名称
  static String get appTypeName {
    if (appType == 'prod') {
      return '生产';
    } else if (appType == 'stage') {
      return '内测';
    } else {
      return '开发';
    }
  }

  /// 应用程序API
  static const appAPI = String.fromEnvironment(
    'APP_API',
    defaultValue: 'https://dtx-api-dev.gate.bjknrt.com/',
  );

  /// 应用程序API超时时间
  static const apiTimeOut = int.fromEnvironment(
    'API_TIME_OUT',
    defaultValue: 3000,
  );

  /// 是否开启ApiMock
  static const apiMock = bool.fromEnvironment("API_MOCK", defaultValue: true);
}
