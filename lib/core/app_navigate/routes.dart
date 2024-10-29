import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarot_app/core/fade_page_route.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/daily_message.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/daily_tarot.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/widgets/daily_tarot_bloc_provider.dart';
import 'package:tarot_app/presentation/ui/screens/home/home.dart';
import 'package:tarot_app/presentation/ui/screens/tea_leaf/tea_leaf.dart';

enum Routes {home, dailyTarot, dailyMessage, tarotList, tarotDetails, cardInfo, teaLeaf, booking}

class _Path{
  static const String home = "/";
  static const String dailyTarot = "/daily_tarot";
  static const String dailyMessage = "/daily_tarot/daily_message";
  static const String tarotList = "/tarot_list";
  static const String tarotDetails = "/daily_tarot_details";
  static const String cardInfo = "/card_info";
  static const String teaLeaf = "/tea_leaf.dart";
  static const String booking = "/booking";

  static const Map<Routes, String> _pathMaps = {
    Routes.home: _Path.home,
    Routes.dailyTarot: _Path.dailyTarot,
    Routes.dailyMessage: _Path.dailyMessage,
    Routes.tarotList: _Path.tarotList,
    Routes.tarotDetails: _Path.tarotDetails,
    Routes.cardInfo: _Path.cardInfo,
    Routes.teaLeaf: _Path.teaLeaf,
    Routes.booking: _Path.booking
  };

  static String of(Routes route) => _pathMaps[route] ?? "/";
}

class AppNavigator{
  static GoRouter onGenerateRoute(){
    final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: "/",
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (BuildContext context, GoRouterState state){
            return FadeRoute(page: const HomeScreen());
          },
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child){
            return DailyTarotBlocProviderWidget(
                child: child
            );
          },
          routes: [
            GoRoute(
              path: '/daily_tarot',
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state){
                return FadeRoute(page: const DailyTarotScreen());
              },
              routes: [
                GoRoute(
                  path: 'daily_message',
                  pageBuilder: (BuildContext context, GoRouterState state){
                    return FadeRoute(page: const DailyMessageScreen());
                  },
                )
              ]
            ),
          ]
        ),
      ]
    );
  }

  static void push<T>({required BuildContext context, required Routes route, T? arguments}) => context.push(_Path.of(route), extra: arguments);

  static void go<T>({required BuildContext context, required Routes route, T? arguments}) => context.push(_Path.of(route), extra: arguments);
}



