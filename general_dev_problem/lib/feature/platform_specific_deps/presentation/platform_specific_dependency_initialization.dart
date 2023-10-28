import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';
import 'package:platform_dependency/feature/platform_specific_deps/presentation/example_stateful_widget_without_casting.dart';
import 'package:platform_dependency/feature/platform_specific_deps/presentation/example_widget_with_casting.dart';
import 'package:platform_dependency/feature/platform_specific_deps/presentation/example_widget_without_casting.dart';

class PlatformSpecificDependencyRoute extends RouteBuilder {
  @override
  Route mold(RouteSettings settings) {
    return MaterialPageRoute(builder: (ctx) => const DemoDepsScreen());
  }
}

class DemoDepsScreen extends StatelessWidget {
  const DemoDepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency demo"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExampleWidgetWithCasting(),
            ExampleWidgetWihoutCasting(),
            StatefulPlatformTextExample(),
          ],
        ),
      ),
    );
  }
}
