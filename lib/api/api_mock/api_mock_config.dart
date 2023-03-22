import 'package:pseudo_we_chat/api/api_mock/directory/directory.dart';
import 'package:pseudo_we_chat/api/api_mock/home/home.dart';
import 'package:pseudo_we_chat/api/api_mock/message/message.dart';
import 'package:pseudo_we_chat/api/api_mock/user/user.dart';
import 'package:pseudo_we_chat/api/interface/directory/directory.dart';
import 'package:pseudo_we_chat/api/interface/discover/discover.dart';
import 'package:pseudo_we_chat/api/interface/home/home.dart';
import 'package:pseudo_we_chat/api/interface/message/message.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';

import 'discover/discover.dart';

typedef MockCallback = void Function();

class ApiMockConfig {
  static Map<String, MockCallback> mockMap = {
    /// 用户登录
    UserApi.accountLoginPath: UserApiMock.accountLoginMock,
    UserApi.phoneLoginPath: UserApiMock.phoneLoginMock,
    UserApi.userInfoPath: UserApiMock.userInfoMock,

    /// 消息页
    MessageApi.messageListPath: MessageApiMock.messageList,

    /// 通讯录页
    DirectoryApi.directoryListPath: DirectoryApiMock.directoryList,
    DirectoryApi.defaultGroupPath: DirectoryApiMock.defaultGroupList,

    /// 发现页
    DiscoverApi.discoverListPath: DiscoverApiMock.discoverList,

    /// 我的页
    HomeApi.homeListPath: HomeApiMock.homeListMock
  };
}
