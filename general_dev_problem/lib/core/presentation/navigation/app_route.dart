import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/navigation/route_names.dart';
import 'package:platform_dependency/feature/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:platform_dependency/feature/form_validation/presentation/screen/demo_form_screen.dart';
import 'package:platform_dependency/feature/input_validation/presentation/input_validation_screen.dart';
import 'package:platform_dependency/feature/platform_specific_deps/presentation/platform_specific_dependency_initialization.dart';

class AppRoute {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.dashboardRoute:
        return DashboardRoute().mold(settings);
      case RouteName.inputValidationRoute:
        return InputValidationRoute().mold(settings);
      case RouteName.formValidationRoute:
        return FormValidationRoute().mold(settings);
      case RouteName.dependencyInitializationRoute:
        return PlatformSpecificDependencyRoute().mold(settings);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Route Defined for ${settings.name}"),
            ),
          ),
        );
        ;
    }
  }
}
