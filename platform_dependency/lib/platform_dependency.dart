import 'package:get_it/get_it.dart';
import 'package:platform_dependency/platform_checker.dart';

abstract class PlatformDependency {
  Future<void> initialize(GetIt getIt);
}

class AndroidDependency extends PlatformDependency {
  @override
  Future<void> initialize(GetIt getIt) {
    // TODO: implement initialize
    throw UnimplementedError();
  }
}

class IosDependency extends PlatformDependency {
  @override
  Future<void> initialize(GetIt getIt) {
    // TODO: implement initialize
    throw UnimplementedError();
  }
}

class PlatformDependencyImpl implements PlatformDependency {
  final PlatformProvider platformProvider;
  final PlatformDependency iOSDep;
  final PlatformDependency androidDep;

  PlatformDependencyImpl(
    this.platformProvider,
    this.iOSDep,
    this.androidDep,
  );
  @override
  Future<void> initialize(GetIt getIt) async {
    switch (platformProvider.getPlatform) {
      case PlatformSupport.android:
        androidDep.initialize(getIt);
        break;
      case PlatformSupport.iOS:
        iOSDep.initialize(getIt);
        break;
    }
  }
}

class PlatformDependencyWithMacOSSupport extends PlatformDependencyImpl {
  final PlatformDependency macOSDeps;
  PlatformDependencyWithMacOSSupport(
    super.platformProvider,
    super.iOSDep,
    super.androidDep,
    this.macOSDeps,
  );

  @override
  Future<void> initialize(GetIt getIt) async {
    super.initialize(getIt);
    if (platformProvider.getPlatform == PlatformSupport.macOS) {
      //
    }
  }
}
