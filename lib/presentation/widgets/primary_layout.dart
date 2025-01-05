import 'package:ease_my_deal_assignment/core/constants/routes.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/presentation/view/app_setting.dart/app_setting.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/app_setting_bloc/app_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryLayout extends StatefulWidget {
  final Widget child;
  final bool isBack; 

  const PrimaryLayout({
    super.key,
    required this.child,
    this.isBack = true,
  });

  @override
  _StatePrimaryLayout createState() => _StatePrimaryLayout();
}

class _StatePrimaryLayout extends State<PrimaryLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: _buildAppBar(context, widget.isBack),
      body: widget.child,
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context, bool isBack) {
     final AppSettingBloc _appSettingBloc = getIt<AppSettingBloc>();

  return AppBar(
    leading: isBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    title: Text("EasyMyDeal", style: Theme.of(context).textTheme.headlineLarge,),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {    
          Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      // Dispatch LoadAppSettingEvent as soon as the AppSettingScreen is built
      // This ensures that the settings are loaded when the screen is shown
      BlocProvider.of<AppSettingBloc>(context).add(LoadAppSettingEvent());
      
      // Return the AppSettingScreen wrapped with BlocProvider to make AppSettingBloc available
      return BlocProvider.value(
        value: _appSettingBloc,
        child: AppSettingScreen(),
      );
    },
  ),
);
     
                   },
      ),
    ],
  );
}
