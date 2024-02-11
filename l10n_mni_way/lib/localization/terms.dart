part of 'app_localization.dart';

class Term {
  final String _enValue;
  final String _bnValue;
  const Term._(
    this._enValue,
    this._bnValue,
  );

  static const trxnLimit = Term._(
    "Transaction Limit",
    "ট্রানজেকশন লিমিট",
  );

  static const monthlyTrxnCount = Term._(
    "Monthly transaction count",
    "মাসিক ট্রানজেকশন গণনা",
  );

  static const monthlyTrxnAmount = Term._(
    "Monthly transaction amount",
    "মাসিক ট্রানজেকশনের পরিমান",
  );

  static const dailyTrxnAmount = Term._(
    "Daily transaction amount",
    "প্রতিদিনের ট্রানজেকশনের পরিমান",
  );

  static const dailyTrxnCount = Term._(
    "Daily transaction count",
    "প্রতিদিনের ট্রানজেকশন গণনা",
  );

  static const perTrxnMaxLimit = Term._(
    "Per transaction max amount",
    "প্রতি ট্রানজেকশনে সর্বোচ্চ পরিমান",
  );

  static const perTrxnMinLimit = Term._(
    "Per transaction min amount",
    "প্রতি ট্রানজেকশনে সর্বনিম্ন পরিমান",
  );

  static const trxnType = Term._(
    "Transaction Type",
    "ট্রানজেকশনের ধরণ",
  );

  static const times = Term._(
    "Times",
    "বার",
  );
  static const title = Term._(
    "Translation demo",
    "অনুবাদ ডেমো",
  );
  static const home = Term._(
    "Home",
    "প্রথম যবনিকা",
  );
}
