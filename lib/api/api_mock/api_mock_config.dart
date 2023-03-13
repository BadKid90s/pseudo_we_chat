import 'package:pseudo_we_chat/api/api_mock/user/user.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';

typedef MockCallback = void Function();

class ApiMockConfig {
  static Map<String, MockCallback> mockMap = {
    UserApi.accountLoginPath: UserApiMock.accountLoginMock,
    UserApi.phoneLoginPath: UserApiMock.phoneLoginMock,
  };
}
