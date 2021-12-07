import 'dart:ui';

import 'package:get/get.dart';

import '../data/app_translations.dart';
import '../services/storage_service.dart';

extension on String {
  Locale get toLocale {
    final split = this.split('_');
    return Locale(split.first, split.last);
  }
}

class LocaleController {
  final _storage = LocaleStorage();

  Locale? getLocale() {
    final localeCode = _storage.load();
    if (localeCode != null) {
      return localeCode.toLocale;
    } else {
      return Get.deviceLocale;
    }
  }

  void changeLocale() {
    if (Get.locale == AppTranslations.jaJP) {
      Get.updateLocale(AppTranslations.enUS);
    } else {
      Get.updateLocale(AppTranslations.jaJP);
    }
    _storage.save(Get.locale.toString());
  }
}
