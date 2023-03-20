import 'package:pseudo_we_chat/api/api_mock/directory/directory.dart';
import 'package:pseudo_we_chat/api/api_mock/message/message.dart';
import 'package:pseudo_we_chat/api/api_mock/user/user.dart';
import 'package:pseudo_we_chat/api/interface/directory/directory.dart';
import 'package:pseudo_we_chat/api/interface/message/message.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';

typedef MockCallback = void Function();

class ApiMockConfig {
  static Map<String, MockCallback> mockMap = {
    /// 用户登录
    UserApi.accountLoginPath: UserApiMock.accountLoginMock,
    UserApi.phoneLoginPath: UserApiMock.phoneLoginMock,

    /// 消息页
    MessageApi.messageListPath: MessageApiMock.messageList,

    /// 通讯录页
    DirectoryApi.directoryListPath: DirectoryApiMock.directoryList,
    DirectoryApi.defaultGroupPath: DirectoryApiMock.defaultGroupList,
  };
}
