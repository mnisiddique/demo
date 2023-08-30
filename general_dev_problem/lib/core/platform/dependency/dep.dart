import 'package:get_it/get_it.dart';

import '../platform_spec.dart';

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

/// Initilizes a list of platform dependency
/// based on given platform-specification
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
