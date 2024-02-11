import 'package:flutter/material.dart';
import 'package:l10n_mni_way/extensions.dart';
import 'package:l10n_mni_way/localization/app_localization.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final Term title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TranslatableText(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TranslatableText(Term.dailyTrxnAmount),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.monthlyTrxnAmount),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.perTrxnMaxLimit),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.perTrxnMinLimit),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.monthlyTrxnCount),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.dailyTrxnCount),
            const SizedBox(height: 4.0),
            const TranslatableText(Term.trxnType),
            const SizedBox(height: 4.0),
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

class TranslatableText extends StatelessWidget {
  final Term term;
  final TextStyle? style;
  const TranslatableText(
    this.term, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(term),
      style: style ?? Theme.of(context).textTheme.bodyLarge,
    );
  }
}
