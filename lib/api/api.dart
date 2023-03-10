import 'api_actual/user/user.dart';
import 'api_mock/user/user.dart';
import 'interface/user/user.dart';

class Api {
  static const bool _isMock = true;
  static UserApi userApi = _isMock ? ActualUserApi() : MockUserApi();
}
