import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:task_todo_getx/screens/todoscreen.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: TodoScreen(),
  ));
}
