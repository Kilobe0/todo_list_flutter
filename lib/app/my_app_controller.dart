import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';

class MyAppController {
  static final MyAppController instance = MyAppController();

  init() async {
    isDark.value = await SharedService.instance.getValue(key: 'isDark') ?? true;
  }

  ValueNotifier<bool> isDark = ValueNotifier<bool>(true);

  bool get getIsDark => isDark.value;

  void changeTheme() async {
    isDark.value = !isDark.value;
    await SharedService.instance.setValue(key: 'isDark', value: isDark.value);
  }
}
