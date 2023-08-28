import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';

class FormValidationRoute extends RouteBuilder {
  @override
  Route mold(RouteSettings settings) {
    return MaterialPageRoute(builder: (ctx) => const DemoFormScreen());
  }
}

class DemoFormScreen extends StatelessWidget {
  const DemoFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      body: const Center(
        child: Text("Under Development"),
      ),
    );
  }
}
