import 'package:ease_my_deal_assignment/core/constants/routes.dart';
import 'package:ease_my_deal_assignment/core/constants/strings.dart';
import 'package:ease_my_deal_assignment/presentation/view/home/home_screen.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => getIt<ProductBloc>()..add(FetchProducts()),
        ),
        
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: Routes.routes,
        home: HomeScreen(),
      ),
    );
  }
}
