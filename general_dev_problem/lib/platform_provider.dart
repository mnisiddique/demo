import 'package:flutter/services.dart';

abstract class PlatformProvider {
  TargetPlatform get platform;
}

abstract class PlatformSupport {
  TargetPlatform get supportedPlatform;
  bool get willMatchIf;
}

// It should be current target platform