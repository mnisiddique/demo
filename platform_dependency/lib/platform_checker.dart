// Cannot be extended

import 'dart:io';

enum PlatformSupport { android, iOS, macOS }

abstract class PlatformProvider {
  PlatformSupport get getPlatform;
}

class PlatformProviderImpl implements PlatformProvider {
  @override
  PlatformSupport get getPlatform {
    if (Platform.isAndroid) {
      return PlatformSupport.android;
    } else if (Platform.isIOS) {
      return PlatformSupport.iOS;
    }
    throw UnsupportedError("message");
  }
}
