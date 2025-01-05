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

  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: BlocBuilder<AppSettingBloc, AppSettingState>(
      bloc: _appSettingBloc,
      builder: (context, state) {
        if (state is AppSettingLoadedState) {
          final appSetting = state.appSetting;

          return AppBar(
            leading: isBack
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : null,
            title: Text(
              "EaseMyDeal",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              if (appSetting.showSearchIcon)
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              if (appSetting.showWishListIcon)
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
              if (appSetting.showCartIcon)
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        _appSettingBloc.add(LoadAppSettingEvent());
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
        } else if (state is AppSettingLoadingState) {
          return AppBar(
            title:  Text("EaseMyDeal",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w400,
        // color: Colors.blueAccent,
        letterSpacing: 1.2,
      )),
            actions: [Center(child: CircularProgressIndicator())],
          );
        } else {
          return AppBar(
            title: const Text("EaseMyDeal"),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: _appSettingBloc,
                        child: AppSettingScreen(),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    ),
  );
}
