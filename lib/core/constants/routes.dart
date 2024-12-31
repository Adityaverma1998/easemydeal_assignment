import 'package:ease_my_deal_assignment/presentation/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  Routes._();
  static const String  home="/";
    static final routes = <String, WidgetBuilder>{
      home:(BuildContext context)=>  HomeScreen(),
    };

}