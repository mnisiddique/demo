import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';
import 'package:platform_dependency/feature/dashboard/presentation/model/feature_model.dart';

class DashboardRoute extends RouteBuilder {
  @override
  Route mold(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Column(
        children: [
          Expanded(
            child: FeatureListView(
              features: FeatureList.features,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureListView extends StatelessWidget {
  final List<FeatureModel> features;
  const FeatureListView({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: features.length,
      itemBuilder: (ctx, idx) => FeatureItem(model: features[idx]),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final FeatureModel model;
  const FeatureItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.featured_play_list),
      title: Text(model.featureName),
      onTap: () => Navigator.pushNamed(context, model.routeName),
    );
  }
}
