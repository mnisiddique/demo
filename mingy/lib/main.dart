import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String camelCase = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pagetTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CalendarDatePicker(
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(1900),
            //   lastDate: DateTime(2100),
            //   onDateChanged: (value) {},
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    camelCase = CamelCaseConverter.toCamelCase(value);
                  });
                },
              ),
            ),
            Text(
              camelCase,
            ),
            Text(
              AppLocalizations.of(context)!.tapCountLabel,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CamelCaseConverter {
  static String toCamelCase(String input) {
    input = input.trim().replaceAll("-", " ").replaceAll("_", " ");
    final words = input.split(" ");
    String outPut = "";
    for (String word in words) {
      word = word.trim();
      if (word.isNotEmpty) {
        outPut = "$outPut${word.capitalize()}";
      }
    }
    if (outPut.isEmpty) {
      return outPut;
    }
    return outPut.deCapitalize();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String deCapitalize() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}
