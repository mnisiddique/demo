import 'package:flutter/foundation.dart';

/// To make any class platform specific
/// by forcing it to set its target platform
abstract class PlatformSetting {
  TargetPlatform get targetPlatform;
}

/// To test whether instances in a list
/// those are targetting some platform
/// is satisfying specified platform
abstract class PlatformSpec {
  bool isSatisfied(PlatformSetting setting);
}

/// Tests whether given item satisfies current platform
class CurrentPlatformSpec implements PlatformSpec {
  final TargetPlatform currentPlatform;

  CurrentPlatformSpec(this.currentPlatform);
  @override
  bool isSatisfied(PlatformSetting setting) {
    return setting.targetPlatform == currentPlatform;
  }
}

/// convenient method for accessing current platform spec
CurrentPlatformSpec get currentPlatformSpec =>
    CurrentPlatformSpec(defaultTargetPlatform);
