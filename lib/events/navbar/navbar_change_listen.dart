import 'dart:async';

import 'package:pseudo_we_chat/events/event_bus.dart';
import 'package:pseudo_we_chat/events/navbar/navbar_change_event.dart';

class NavbarChangeListen {
  static StreamSubscription getMessageData(Function callback) {
    return AppEventBus.eventBus.on<NavbarChangeEvent>().listen((event) {
      if (event.navBarType == NavBarType.message) {
        callback();
      }
    });
  }

  static StreamSubscription getDirectoryData(Function callback) {
    return AppEventBus.eventBus.on<NavbarChangeEvent>().listen((event) {
      if (event.navBarType == NavBarType.directory) {
        callback();
      }
    });
  }

  static StreamSubscription getDiscoverData(Function callback) {
    return AppEventBus.eventBus.on<NavbarChangeEvent>().listen((event) {
      if (event.navBarType == NavBarType.discover) {
        callback();
      }
    });
  }

  static StreamSubscription getHomeData(Function callback) {
    return AppEventBus.eventBus.on<NavbarChangeEvent>().listen((event) {
      if (event.navBarType == NavBarType.home) {
        callback();
      }
    });
  }
}
