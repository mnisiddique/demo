import 'package:flutter/foundation.dart';

import 'dep.dart';

/// Convenient type so that, we can ommit setting
/// common target over and over again
abstract class AndroidDep extends PlatformDep {
  AndroidDep(super.getIt);

  @override
  TargetPlatform get targetPlatform => TargetPlatform.android;
}

class AndroidDepImpl extends AndroidDep {
  AndroidDepImpl(super.getIt);

  @override
  Future<void> initialize() {
    throw UnimplementedError();
  }
}
