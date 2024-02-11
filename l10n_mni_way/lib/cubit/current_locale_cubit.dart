import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_locale_state.dart';

class CurrentLocaleCubit extends Cubit<CurrentLocaleState> {
  CurrentLocaleCubit()
      : super(const CurrentLocaleState(currentLocale: Locale(kEN)));

  void toBengali() {
    emit(const CurrentLocaleState(currentLocale: Locale(kBN)));
  }

  void toEnglish() {
    emit(const CurrentLocaleState(currentLocale: Locale(kEN)));
  }
}
