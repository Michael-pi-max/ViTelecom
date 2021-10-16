import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/screens/LandingScreen.dart';
import 'package:flutter_application_1/src/presentation/screens/completion_page.dart';
import 'package:flutter_application_1/src/presentation/screens/front_page.dart';
import 'package:flutter_application_1/src/presentation/screens/job_started.dart';
import 'package:flutter_application_1/src/presentation/screens/profile.dart';
import 'package:flutter_application_1/src/presentation/screens/work_order.dart';

class AppRouter {
  static const String landingScreen = "/";
  static const String workOrdersScreen = "/workOrdersScreen";
  static const String jobFrontScreen = "/jobFrontScreen";
  static const String jobStartedScreen = "/jobStartedScreen";
  static const String jobCompletedScreen = "/jobCompletedScreen";
  static const String profileScreen = "/profileScreen";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => LandingScreen(),
        );
      case workOrdersScreen:
        return MaterialPageRoute(
          builder: (_) => WorkOrderScreen(),
        );
      case jobFrontScreen:
        return MaterialPageRoute(
          builder: (_) => JobFrontScreen(),
        );
      case jobStartedScreen:
        return MaterialPageRoute(
          builder: (_) => JobStartedScreen(),
        );
      case jobCompletedScreen:
        return MaterialPageRoute(
          builder: (_) => JobCompletedScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      default:
        throw 'Undefined route';
    }
  }
}
