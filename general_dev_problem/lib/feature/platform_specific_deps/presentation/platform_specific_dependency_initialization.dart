import 'package:flutter/material.dart';
import 'package:platform_dependency/core/platform/platform_filter.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';

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
        child: Text("Under Development"),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Android Text");
  }
}