import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';

class InputValidationRoute extends RouteBuilder {
  @override
  Route mold(RouteSettings settings) {
    return MaterialPageRoute(builder: (ctx) => const InputValidationScreen());
  }
}

class InputValidationScreen extends StatelessWidget {
  const InputValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Validation Demo"),
      ),
      body: const Center(
        child: Text("Under Development"),
      ),
    );
  }
}
