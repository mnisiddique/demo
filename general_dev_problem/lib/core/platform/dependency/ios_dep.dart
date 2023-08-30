import 'package:flutter/foundation.dart';

import 'dep.dart';

/// Convenient type so that, we can ommit setting
/// common target over and over again
abstract class IosDep extends PlatformDep {
  IosDep(super.getIt);

  @override
  TargetPlatform get targetPlatform => TargetPlatform.iOS;
}

class IosDepImpl extends IosDep {
  IosDepImpl(super.getIt);

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }
}
