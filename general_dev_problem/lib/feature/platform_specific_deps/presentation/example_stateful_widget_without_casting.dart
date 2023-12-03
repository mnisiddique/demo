import 'package:flutter/material.dart';
import 'package:platform_dependency/core/platform/platform_refiner.dart';

class StatefulPlatformTextExample extends StatelessWidget {
  const StatefulPlatformTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformRefiner<BasePlatformStatefullWidget>(
      platformAims: [
        const StatefullAndroidText(),
        const StatefullIOSText(),
      ],
    ).refine().first;
  }
}

abstract class BasePlatformStatefullWidget extends StatefulWidget
    with PlatformAim {
  const BasePlatformStatefullWidget({super.key});
}

class StatefullAndroidText extends BasePlatformStatefullWidget
    with PlatformAimAndroid {
  const StatefullAndroidText({super.key});

  @override
  State<StatefullAndroidText> createState() => _StatefullAndroidTextState();
}

class _StatefullAndroidTextState extends State<StatefullAndroidText> {
  @override
  Widget build(BuildContext context) {
    return const Text("Android Statefull Text Widget");
  }
}

class StatefullIOSText extends BasePlatformStatefullWidget with PlatformAimIOS {
  const StatefullIOSText({super.key});

  @override
  State<StatefullIOSText> createState() => _StatefullIOSTextState();
}

class _StatefullIOSTextState extends State<StatefullIOSText> {
  @override
  Widget build(BuildContext context) {
    const String dayNo = "1";

    String day = switch (dayNo) {
      "1" => "Staturday",
      "2" => "Sunday",
      _ => "Monday",
    };
    debugPrint(day);

    return const Text("IOS Statefull Text Widget");
  }
}

