import 'dart:ui';

import 'package:get/get.dart';

class AppTranslations extends Translations {
  static const jaJP = Locale('ja', 'JP');
  static const enUS = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys {
    return {
      jaJP.toString(): {
        'title': 'ゲットエックスやることアプリデモ',
        'delete_done': '完了削除',
        'add_new': '新規追加',
        'cancel': 'キャンセル',
        'add': '追加',
        'update': '更新',
        'confirm_delete': 'ほんとに消しますか？',
        'yes': 'はい',
        'no': 'いいえ',
        'page_not_found': 'ページが見つかりません',
        'to_home': 'ホームへ',
        'new_todo': '新規',
        'your_plan': 'あなたが今やりたいことは？',
      },
      enUS.toString(): {
        'title': 'GetX Todo App Demo',
        'delete_done': 'Remove Done',
        'add_new': 'Add New',
        'cancel': 'Cancel',
        'add': 'Add',
        'update': 'Update',
        'confirm_delete': 'Are you sure?',
        'yes': 'Yes',
        'no': 'NO',
        'page_not_found': 'Page Not Found',
        'to_home': 'To Home',
        'new_todo': 'New',
        'your_plan': 'What is your plan today?',
      },
    };
  }
}
