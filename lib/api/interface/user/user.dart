abstract class UserApi {
  ///
  ///
  ///
  UserInfo accountLogin(String username, String password,
      {String path = "/login"});
}

class UserInfo {
  String name;

  UserInfo(this.name);
}
