import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

abstract class InputError {
  bool doesExist(String value);

  /// BuildContext is taken as param
  /// so that we can translate message.
  /// In flutter official way of localization,
  /// translation keys are tightly coupled with context.
  /// So to provide translated message context is needed.
  String message(BuildContext context);
}

///  Detects error by regular expression.
///  provides common fluntionality to avoid error.
abstract class InputErrorByRegExp extends InputError {
  final String pattern;

  InputErrorByRegExp(this.pattern);
  @override
  bool doesExist(String value) => !RegExp(pattern).hasMatch(value);
}

abstract class UserInput extends FormzInput<String, InputError> {
  const UserInput.pure() : super.pure('');
  const UserInput.dirty(String value) : super.dirty(value);

  List<InputError> get errorSpecs;

  @override
  InputError? validator(String value) {
    try {
      return errorSpecs.firstWhere(
        (errSpec) => errSpec.doesExist(value),
      );
    } on StateError {
      return null;
    }
  }
}
