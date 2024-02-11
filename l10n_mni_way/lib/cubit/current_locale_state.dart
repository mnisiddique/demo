part of 'current_locale_cubit.dart';

@immutable
class CurrentLocaleState extends Equatable {
  final Locale currentLocale;
  String get languageCode => currentLocale.languageCode;

  const CurrentLocaleState({required this.currentLocale});

  @override
  List<Object?> get props => [languageCode];
}

const String kEN = "en";
const String kBN = "bn";
