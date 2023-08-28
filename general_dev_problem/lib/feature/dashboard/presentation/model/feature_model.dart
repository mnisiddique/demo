import 'package:platform_dependency/core/presentation/navigation/route_names.dart';

class FeatureModel {
  final String featureName;
  final String routeName;

  FeatureModel({
    required this.featureName,
    required this.routeName,
  });
}

class FeatureList {
  static List<FeatureModel> get features {
    List<FeatureModel> models = [];
    models.add(FeatureModel(
      featureName: "User Input Validation",
      routeName: RouteName.inputValidationRoute,
    ));
    models.add(FeatureModel(
      featureName: "User Input Form Validation",
      routeName: RouteName.formValidationRoute,
    ));
    models.add(FeatureModel(
      featureName: "Dependency Initialization",
      routeName: RouteName.dependencyInitializationRoute,
    ));
    return models;
  }
}
