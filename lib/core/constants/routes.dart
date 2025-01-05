import 'package:ease_my_deal_assignment/presentation/view/app_setting.dart/app_setting.dart';
import 'package:ease_my_deal_assignment/presentation/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const String home = "/home";
  static const String settings = "/settings";

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    settings: (BuildContext context) => AppSettingScreen()
  };
}
