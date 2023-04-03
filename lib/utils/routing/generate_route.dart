import 'package:flutter/material.dart';
import 'package:hydra_sip/modules/dashboard/dashboard.dart';

class RouteConstants {
  static const String dashboard = 'dashboard';
}

class GenerateRoute {
  static Route generate(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case RouteConstants.dashboard:
        page = const DashboardPage();
        break;
      default:
        page = const Placeholder();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // The tween object.
        final Animatable<Offset> routeAnimation = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.ease));
        return SlideTransition(position: animation.drive(routeAnimation));
      },
    );
  }
}
