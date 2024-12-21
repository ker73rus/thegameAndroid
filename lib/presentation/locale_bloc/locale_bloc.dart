import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegame/components/locale/l10n/app_locale.dart';
import 'package:thegame/presentation/locale_bloc/locale_event.dart';
import 'package:thegame/presentation/locale_bloc/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(Locale defaultLocale) : super(LocaleState(currentLocale: defaultLocale)) {
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  Future<void> _onChangeLocale(ChangeLocaleEvent event, Emitter<LocaleState> emit) async {
    final toChange = Applocale.supportedLocales
        .firstWhere((e) => e.languageCode != state.currentLocale.languageCode);
    emit(state.copyWith(currentLocale: toChange));
  }
}
