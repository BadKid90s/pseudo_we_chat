import '../../interface/user/user.dart';

class MockUserApi extends UserApi {
  @override
  UserInfo accountLogin(String username, String password,
      {String path = "/login"}) {
    // TODO: implement accountLogin
    throw UnimplementedError();
  }
}
