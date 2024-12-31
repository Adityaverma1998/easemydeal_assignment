import 'dart:developer';

import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/presentation/main_app.dart';
import 'package:flutter/material.dart';

void main() async{
  await ServiceLocator.configureDependencies();
  runApp( const MainApp());
}
