import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:platform_dependency/core/platform/dependency/android_dep.dart';
import 'package:platform_dependency/core/platform/dependency/dep.dart';
import 'package:platform_dependency/core/platform/dependency/ios_dep.dart';
import 'package:platform_dependency/core/platform/platform_spec.dart';

class PlatformDependency {
  static void init(GetIt getIt) async {
    List<PlatformDep> deps = [
      AndroidDepImpl(getIt),
      IosDepImpl(getIt),
    ];

    final currentPlatformSpec = CurrentPlatformSpec(defaultTargetPlatform);

    PlatformDepInitilizer initializer = PlatformDepInitilizer(
      deps: deps,
      spec: currentPlatformSpec,
    );

    await initializer.initialize();
  }
}
