import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';

class MyAppController {
  static final MyAppController instance = MyAppController();

  init() {
    isDark.value = SharedService.instance.prefs.getBool(SharedKeys.isDark) ?? true;
  }

  ValueNotifier<bool> isDark = ValueNotifier<bool>(true);

  bool get getIsDark => isDark.value;

  void changeTheme() async {
    isDark.value = !isDark.value;
    await SharedService.instance.prefs.setBool(SharedKeys.isDark, isDark.value);
  }
}
