import 'package:flutter/material.dart';
import 'package:platform_dependency/core/platform/platform_refiner.dart';

class ExampleWidgetWithCasting extends StatelessWidget {
  const ExampleWidgetWithCasting({super.key});

  @override
  Widget build(BuildContext context) {
    PlatformRefiner pFilter = PlatformRefiner(platformAims: [
      const PlatformText1(),
      const PlatformText2(),
    ]);
    Widget textWidget = pFilter.refine().first as Widget;
    return textWidget;
  }
}

class PlatformText1 extends StatelessWidget with PlatformAimAndroid {
  const PlatformText1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Android Text");
  }
}

class PlatformText2 extends StatelessWidget with PlatformAimIOS {
  const PlatformText2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("IOS Text");
  }
}

class TextWidget3 extends StatelessWidget {
  const TextWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("IOS Text");
  }
}
