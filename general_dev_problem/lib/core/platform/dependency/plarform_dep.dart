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

    PlatformDepInitilizer initializer = PlatformDepInitilizer(
      deps: deps,
      spec: currentPlatformSpec,
    );

    await initializer.initialize();
  }
}

// TODO: Test 1: dependency that exist only for android and not for iOS
// TODO: Test 2: dependency that exist only for ios and not for android
// TODO: Test 3: dependency that exist both for ios and android