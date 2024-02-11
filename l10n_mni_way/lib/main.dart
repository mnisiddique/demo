import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:l10n_mni_way/cubit/current_locale_cubit.dart';
import 'package:l10n_mni_way/extensions.dart';
import 'package:l10n_mni_way/home.dart';
import 'package:l10n_mni_way/localization/app_localization.dart';

void main() {
  runApp(
    BlocProvider<CurrentLocaleCubit>(
      create: (context) => CurrentLocaleCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocaleCubit, CurrentLocaleState>(
      builder: (context, state) {
        return MaterialApp(
          onGenerateTitle: (context) => context.tr(Term.title),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en", "US"),
            Locale("bn", "BD"),
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: state.currentLocale,
          home: const MyHomePage(title: Term.home),
        );
      },
    );
  }
}
