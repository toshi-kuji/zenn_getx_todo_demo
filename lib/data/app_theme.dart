import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    fontFamily: 'DotGothic',
    colorScheme: const ColorScheme.light(
      primary: Colors.cyan, // AppBarやチェックボックスなどで使用
      secondary: Colors.pink, // 画面右下のボタンに使用
    ),
  );

  static final dark = ThemeData(
    fontFamily: 'DotGothic',
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.deepPurple, // darkモードにおけるAppBarの背景色
    ),
  );
}
