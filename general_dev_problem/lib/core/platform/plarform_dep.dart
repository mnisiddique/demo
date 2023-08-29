import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'platform_spec.dart';

/// Dep is short for dependency. depncy
/// Dep aims to generalize any dependency initialization.
abstract class Dep {
  Future<void> initialize();
}

/// Generalize dependency type which has
/// behavior of initializing dependency and
/// also the target-platform property that
/// represents platform target of the dependencies.
abstract class PlatformDep extends Dep with PlatformSetting {
  final GetIt getIt;

  PlatformDep(this.getIt);
}

/// Convenient type so that, we can ommit setting
/// common target over and over again
abstract class AndroidDep extends PlatformDep {
  AndroidDep(super.getIt);

  @override
  TargetPlatform get targetPlatform => TargetPlatform.android;
}

/// Convenient type so that, we can ommit setting
/// common target over and over again
abstract class IosDep extends PlatformDep {
  IosDep(super.getIt);

  @override
  TargetPlatform get targetPlatform => TargetPlatform.iOS;
}

class PlatformDepInitilizer implements Dep {
  final PlatformSpec spec;
  final List<PlatformDep> deps;

  PlatformDepInitilizer({
    required this.deps,
    required this.spec,
  });

  @override
  Future<void> initialize() async {
    final currPlatformDep = deps.where((dep) => spec.isSatisfied(dep)).toList();
    await Future.wait(currPlatformDep.map((dep) => dep.initialize()));
  }
}


// android_dep.dart
// ios_dep.dart
// platform_dep.dart