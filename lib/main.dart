import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegame/components/locale/l10n/app_locale.dart';
import 'package:thegame/data/repositories/thegame_repository.dart';
import 'package:thegame/presentation/bloc/bloc.dart';
import 'package:thegame/presentation/bloc_main/main_bloc.dart';
import 'package:thegame/presentation/buy_bloc/buy_bloc.dart';
import 'package:thegame/presentation/home_page/home_page.dart';
import 'package:thegame/presentation/locale_bloc/locale_bloc.dart';
import 'package:thegame/presentation/locale_bloc/locale_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleBloc>(
      lazy: false,
      create: (context) => LocaleBloc(Locale(Platform.localeName)),
      child: BlocBuilder<LocaleBloc, LocaleState>(builder: (context, state) {
        return MaterialApp(
          locale: state.currentLocale,
          localizationsDelegates: Applocale.localizationsDelegates,
          supportedLocales: Applocale.supportedLocales,
          home: RepositoryProvider(
            lazy: false,
            create: (_) => ThegameRepository(),
            child: BlocProvider<BuyBloc>(
              create: (context) => BuyBloc(),
              child: BlocProvider<MainBloc>(
                lazy: false,
                create: (context) => MainBloc(),
                child: BlocProvider<HomeBloc>(
                    lazy: false,
                    create: (context) => HomeBloc(context.read<ThegameRepository>()),
                    child: const MyHomePage()),
              ),
            ),
          ),
        );
      }),
    );
  }
}
