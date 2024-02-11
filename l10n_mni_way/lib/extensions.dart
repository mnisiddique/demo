import 'package:flutter/material.dart';
import 'package:l10n_mni_way/localization/app_localization.dart';

extension LocalizationExtension on BuildContext {
  String  tr(Term term) => AppLocalizations.of(this)!.translate(term);
}