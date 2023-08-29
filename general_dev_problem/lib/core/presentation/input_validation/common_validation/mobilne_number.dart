import 'package:flutter/material.dart';
import 'package:platform_dependency/core/presentation/input_validation/user_input.dart';

class _MobileNoLengthError extends InputErrorByRegExp {
  _MobileNoLengthError(super.pattern);

  @override
  String message(BuildContext context) {
    return "Mobile Number should be 11 digit long";
  }
}

class _MobileNoAreaCodeError extends InputErrorByRegExp {
  _MobileNoAreaCodeError(super.pattern);

  @override
  String message(BuildContext context) {
    return "Mobile Number should start with 013|014|015|016..";
  }
}

class _MobileNoInvalidError extends InputErrorByRegExp {
  _MobileNoInvalidError(super.pattern);

  @override
  String message(BuildContext context) {
    return "invalid mobile number";
  }
}

class MobileNumberInput extends UserInput {
  const MobileNumberInput.pure() : super.pure();
  const MobileNumberInput.dirty(String value) : super.dirty(value);

  @override
  List<InputError> get errorSpecs => [
        _MobileNoAreaCodeError(r'^(01[3-9])'),
        _MobileNoLengthError(r'^.{11}$'),
        _MobileNoInvalidError(r'^(01[3-9])([0-9]){8}$'),
      ];
}
