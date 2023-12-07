// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:test_app/service/routes/routes_name.dart';
import 'package:test_app/views/auth_view/auth_page.dart';
import '../../src/controllers/enter_number_cont.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final AppStreamController _controller = AppStreamController();


class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState?.canPop() ?? false;
        if (canPop) {
          navigatorKey.currentState?.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: MainRoutes.AboutPage,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {
            case MainRoutes.AboutPage:
              builder = (BuildContext _) => AuthPage(controller: _controller,);
              break;
          }
          if (builder != null) {
            return MaterialPageRoute(builder: builder, settings: settings);
          }
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}