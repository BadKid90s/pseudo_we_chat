import 'package:get/get.dart';
import 'package:pseudo_we_chat/i18n_en.dart';
import 'package:pseudo_we_chat/i18n_zh.dart';

class I18nMessages extends Translations {
  @override

  Map<String, Map<String, String>> get keys =>
      {'zh_CN': I18nZh.message, 'en_Us': I18nEn.message};
}
