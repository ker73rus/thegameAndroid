import 'package:flutter/cupertino.dart';
import 'package:thegame/components/locale/l10n/app_locale.dart';

extension LocalContextX on BuildContext {
  Applocale get locale => Applocale.of(this)!;
}
