// import 'package:get_it/get_it.dart';
// import 'package:platform_dependency/platform_checker.dart';

// // Following code is violating OCP
// // and threat in maintaining LSP
// // need to find a beeter way

// abstract class PlatformDependency {
//   Future<void> initialize(GetIt getIt);
// }

// class AndroidDependency extends PlatformDependency {
//   @override
//   Future<void> initialize(GetIt getIt) {
//     // TODO: implement initialize
//     throw UnimplementedError();
//   }
// }

// class IosDependency extends PlatformDependency {
//   @override
//   Future<void> initialize(GetIt getIt) {
//     // TODO: implement initialize
//     throw UnimplementedError();
//   }
// }

// class PlatformDependencyImpl implements PlatformDependency {
//   final PlatformProvider platformProvider;
//   final PlatformDependency iOSDep;
//   final PlatformDependency androidDep;

//   PlatformDependencyImpl(
//     this.platformProvider,
//     this.iOSDep,
//     this.androidDep,
//   );
//   @override
//   Future<void> initialize(GetIt getIt) async {
//     switch (platformProvider.getPlatform) {
//       case TargetPlatform.android:
//         androidDep.initialize(getIt);
//         break;
//       case TargetPlatform.iOS:
//         iOSDep.initialize(getIt);
//         break;
//     }
//   }
// }

// class PlatformDependencyWithMacOSSupport extends PlatformDependencyImpl {
//   final PlatformDependency macOSDeps;
//   PlatformDependencyWithMacOSSupport(
//     super.platformProvider,
//     super.iOSDep,
//     super.androidDep,
//     this.macOSDeps,
//   );

//   @override
//   Future<void> initialize(GetIt getIt) async {
//     super.initialize(getIt);
//     if (platformProvider.getPlatform == TargetPlatform.macOS) {
//       //
//     }
//   }
// }


// // What do I want?
// // I want to:
// // 1. initialize dependency platform-wise
// // 2. extend dependency initialization to facilitate supporting more platform
// // 3. keep existing code untouched