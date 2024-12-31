import 'package:ease_my_deal_assignment/core/constants/routes.dart';
import 'package:ease_my_deal_assignment/core/constants/strings.dart';
import 'package:ease_my_deal_assignment/presentation/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.white,
      ),
      routes: Routes.routes,

      home:HomeScreen()
    );
      
  }

}