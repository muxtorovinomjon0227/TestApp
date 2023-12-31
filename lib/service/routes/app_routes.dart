// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/service/routes/routes_name.dart';
import 'package:test_app/src/utils/hive_utils/hive_utils.dart';
import 'package:test_app/views/auth_view/auth_page.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../src/controllers/stream_controller.dart';
import '../../views/main_view/main_page.dart';
import '../../views/profile_view/profile_page.dart';

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
        initialRoute: HiveUtils.box.get(HiveUtils.isRegisterdKey) ?? false
            ? MainRoutes.MainPage
            : MainRoutes.AuthPage,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {
            case MainRoutes.AuthPage:
              builder = (BuildContext _) => MultiBlocProvider(
                    providers: [
                      BlocProvider<AuthBloc>(
                        create: (context) => AuthBloc(),
                      ),
                    ],
                    child: AuthPage(
                      controller: _controller,
                    ),
                  );
              break;
            case MainRoutes.MainPage:
              builder = (BuildContext _) => MainPage(
                    controller: _controller,
                  );
              break;
            case MainRoutes.UserProfile:
              builder = (BuildContext _) => UserProfile(
                    controller: _controller,
                  );
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
