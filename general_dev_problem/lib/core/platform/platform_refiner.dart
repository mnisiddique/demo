import 'package:flutter/foundation.dart';

///  The platform refiner aims to refiner any list of flutter object where each
///  object is meant for some specific platform. The refinering task is done on
///  the basis of platform specification defined as [PlatformSpec].
///  In case of [PlatformSpec] not supplied (Which is assumed to be the most common case)
///  [defaultTargetPlatform] or current platform the app is running, would
///  act as default [PlatformSpec]

/// sets platform aim for any object.
abstract class PlatformAim {
  TargetPlatform get platformAimed;
}

/// sets iOS as platform aim for any object.
class PlatformAimIOS implements PlatformAim {
  @override
  TargetPlatform get platformAimed => TargetPlatform.iOS;
}

/// sets Android as platform aim for any object.
class PlatformAimAndroid implements PlatformAim {
  @override
  TargetPlatform get platformAimed => TargetPlatform.android;
}

/// Specifies target platform, on basis of which, refinering action will be performed
class PlatformSpec {
  final TargetPlatform _trgt;

  const PlatformSpec({required TargetPlatform trgt}) : _trgt = trgt;

  bool isSatisfied(PlatformAim pAim) => _trgt == pAim.platformAimed;
}

/// The refiner that filtrate platforms on the basis of specification [PlatformSpec]
class PlatformRefiner<T extends PlatformAim> {
  final List<T> _platformAims;
  final PlatformSpec _spec;

  PlatformRefiner({
    required List<T> platformAims,
    PlatformSpec? spec,
  })  : _platformAims = platformAims,
        _spec = spec ?? PlatformSpec(trgt: defaultTargetPlatform);

  List<T> refine() => _platformAims.where(_spec.isSatisfied).toList();
}
