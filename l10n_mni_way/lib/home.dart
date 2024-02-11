import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n_mni_way/cubit/current_locale_cubit.dart';
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
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: LangButton(),
                ),
              ),
            )
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

class LangButton extends StatelessWidget {
  const LangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          EnglishButton(),
          BengaliButton(),
        ],
      ),
    );
  }
}

const buttonPadding = 16.0;

class BengaliButton extends StatelessWidget {
  const BengaliButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocaleCubit, CurrentLocaleState>(
      builder: (context, state) {
        return InkWell(
          onTap: context.read<CurrentLocaleCubit>().toBengali,
          child: Container(
            padding: const EdgeInsets.all(buttonPadding),
            color: state.languageCode == kBN
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.white,
            child: TranslatableText(
              Term.bangla,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}

class EnglishButton extends StatelessWidget {
  const EnglishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocaleCubit, CurrentLocaleState>(
      builder: (context, state) {
        return InkWell(
          onTap: context.read<CurrentLocaleCubit>().toEnglish,
          child: Container(
            padding: const EdgeInsets.all(buttonPadding),
            color: state.languageCode == kEN
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.white,
            child: TranslatableText(
              Term.english,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
