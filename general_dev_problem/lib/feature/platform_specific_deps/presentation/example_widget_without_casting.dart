import 'package:flutter/material.dart';
import 'package:platform_dependency/core/platform/platform_refiner.dart';

class ExampleWidgetWihoutCasting extends StatelessWidget {
  const ExampleWidgetWihoutCasting({super.key});

  @override
  Widget build(BuildContext context) {
    // return PlatformRefiner<BasePlatformText>(platformAims: [
    //   const AndroidPlatformText(),
    //   const IOSPlatformText(),
    // ], spec: const PlatformSpec(trgt: TargetPlatform.iOS))
    //     .filtrate()
    //     .first;
    return PlatformRefiner<BasePlatformText>(
      platformAims: [
        const AndroidPlatformText(),
        const IOSPlatformText(),
      ],
    ).refine().first;
  }
}

abstract class BasePlatformText extends StatelessWidget with PlatformAim {
  const BasePlatformText({super.key});
}

class AndroidPlatformText extends BasePlatformText with PlatformAimAndroid {
  const AndroidPlatformText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Android Text From Example Two");
  }
}

class IOSPlatformText extends BasePlatformText with PlatformAimIOS {
  const IOSPlatformText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("IOS Text From Example Two");
  }
}
