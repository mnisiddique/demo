import 'dart:io';

class DemoDeps {}

// What do I want?
// ans: To know which supported/target platform matches the current platform?
// and To extend the support for future by not changing existing code.

/*
 * ****************************************************************
 * Plan:
 * 1. Come up with the strategy of retriving current platform
 * 2. Develop the strategy of filtering dpendency initializer based on platform
 * 3. Develop the plan to apply to widget
 * 4. Develop the plan to apply anywhere
 */

// 1. Come up with the strategy of retriving current platform

abstract class PlatformMatcher {
  bool get isMatched;
}

class AndroidMatcher implements PlatformMatcher {
  const AndroidMatcher();
  @override
  bool get isMatched => Platform.isAndroid;
}

class IosMatcher implements PlatformMatcher {
  const IosMatcher();
  @override
  bool get isMatched => Platform.isIOS;
}





// platform matching job
// abstract class PlatformConfig {
//   TargetPlatform get targetPlatform;
// }

// abstract class PlatformMatcher<T> {
//   bool matchTarget(T subject);
// }

// abstract class PlatformTaskFilter<T> {
//   List<T> filter(List<T> tasks, PlatformMatcher<T> platformSpec);
// }

// // Platform dependent job
// abstract class PlatformDependency extends PlatformConfig {
//   Future<void> init(GetIt sl);
// }

// class AndroidDependency implements PlatformDependency {
//   @override
//   TargetPlatform get targetPlatform => TargetPlatform.android;

//   @override
//   Future<void> init(GetIt sl) async {
//     sl.registerFactory(() => DemoDeps());
//   }
// }
