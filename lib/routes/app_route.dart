import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_made_easy/views/QnA.dart';
import 'package:islam_made_easy/views/errorR.dart';
import 'package:islam_made_easy/views/general_knowledge/general_knowlege.dart';
import 'package:islam_made_easy/views/home.dart';
import 'package:islam_made_easy/settings/settings.dart';
import 'package:islam_made_easy/views/succinct.dart';

class AppRoute extends NavigatorObserver {
  AppRoute._internal();

  static final AppRoute _appRoute = AppRoute._internal();

  factory AppRoute() => _appRoute;
  static final Map<String, WidgetBuilder> _routes = {
    Home.ROUTE_NAME: (_) => Home(),
    QnA.ROUTE_NAME: (_) => QnA(),
    Settings.ROUTE_NAME: (_) => Settings(),
    Succinct.ROUTE_NAME: (_) => Succinct(),
  };

  Map<String, WidgetBuilder> get routes => _routes;

  Route<dynamic> generateRoute(RouteSettings settings) {
    MaterialPageRoute targetPage;
    if (settings.name == Home.ROUTE_NAME) {
      targetPage = MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return Home();
        },
      );
    } else if (settings.name == QnA.ROUTE_NAME) {
      final String args = settings.arguments;
      targetPage = MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return QnA();
        },
      );
    } else if (settings.name == Settings.ROUTE_NAME) {
      targetPage = MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return Settings();
        },
      );
    } else if (settings.name == Succinct.ROUTE_NAME) {
      targetPage = MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return Succinct();
        },
      );
    }
    return targetPage ??
        MaterialPageRoute(builder: (context) {
          return RouteErrorPage(route: settings.name);
        });
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute.settings != null && previousRoute.settings.name != null) {
      setPreferredOrientations(previousRoute.settings);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings != null && route.settings.name != null) {
      setPreferredOrientations(route.settings);
    }
  }

  void setPreferredOrientations(RouteSettings settings) {
    /*
    if(targetPage == "/") {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // 恢复系统默认UI：显示状态栏、虚拟按键导航栏
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    } else if(GeneralKnowledge.ROUTE_NAME == targetName) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // 隐藏状态栏、虚拟按键导航栏
      SystemChrome.setEnabledSystemUIOverlays([]);
    } else if(DetailPage.routeName == targetName) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // 隐藏状态栏、虚拟按键导航栏
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
     */
  }
}

AppRoute appRoute = AppRoute();
