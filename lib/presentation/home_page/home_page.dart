import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegame/components/extensions/context_x.dart';
import 'package:thegame/components/utils/debounce.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/presentation/bloc/bloc.dart';
import 'package:thegame/presentation/bloc/events.dart';
import 'package:thegame/presentation/bloc/state.dart';
import 'package:thegame/presentation/bloc_main/main_bloc.dart';
import 'package:thegame/presentation/bloc_main/main_event.dart';
import 'package:thegame/presentation/bloc_main/main_state.dart';
import 'package:thegame/presentation/buy_bloc/buy_bloc.dart';
import 'package:thegame/presentation/buy_bloc/buy_event.dart';
import 'package:thegame/presentation/buy_bloc/buy_state.dart';
import 'package:thegame/presentation/common/svg_objects.dart';
import 'package:thegame/presentation/details_page/details_page.dart';
import 'package:thegame/presentation/locale_bloc/locale_bloc.dart';
import 'package:thegame/presentation/locale_bloc/locale_event.dart';
import 'package:thegame/presentation/main_page/main_page.dart';

part 'сardView.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body();

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    SvgObjects.init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeLoadDataEvent());
      context.read<BuyBloc>().add(const LoadBuyedEvent());
      context.read<MainBloc>().add(const LoadMainEvent());
    });

    super.initState();
  }

  void _onNextPageListener(int direction) {
    final bloc = context.read<HomeBloc>();
    if (bloc.state.page! + direction >= 1) {
      if (!bloc.state.isPaginationLoading) {
        bloc.add(HomeLoadDataEvent(
          search: searchController.text,
          nextPageNumber: bloc.state.page! + direction,
        ));
      }
    }
    else _navToMain(context);
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: GestureDetector(
        onHorizontalDragEnd: (_) {
          if (_.velocity.pixelsPerSecond.dx < 0) {
            _onNextPageListener(1);
          } else {
            _onNextPageListener(-1);
          }
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CupertinoSearchTextField(
                      controller: searchController,
                      placeholder: context.locale.search,
                      onChanged: (search) {
                        Debounce.run(() => context
                            .read<HomeBloc>()
                            .add(HomeLoadDataEvent(search: search)));
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      context.read<LocaleBloc>().add(const ChangeLocaleEvent()),
                  child: SizedBox.square(
                      dimension: 50,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: context
                                      .read<LocaleBloc>()
                                      .state
                                      .currentLocale
                                      .languageCode ==
                                  'ru'
                              ? Image.asset("assets/ByClick.png")
                              : Image.asset("assets/PerSecond.png"))),
                )
              ],
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => state.error != null
                  ? Text(
                      state.error ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Color(0xFFFF0000)),
                    )
                  : state.isLoading
                      ? const CircularProgressIndicator()
                      : BlocBuilder<BuyBloc, BuyState>(
                          builder: (context, buyState) {
                          return Expanded(
                            child: RefreshIndicator(
                              onRefresh: _onRefresh,
                              child: BlocBuilder<MainBloc,MainState>(
                                builder: (context,mainState) {
                                  return
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: state.data?.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final data = state.data?.data?[index];
                                        final ids = buyState.buyedIds ?? [];
                                        final idsToLvl = buyState.idsToLvl ??
                                            {};
                                        final curId = data?.id;
                                        if (ids.contains(curId)) {
                                          final lvl = int.parse(
                                              idsToLvl[curId] ?? "1");
                                          for (int l = data?.lvl ?? 1; l <=
                                              lvl; l++) {
                                            data?.lvl++;
                                            data?.cost += data.cost * 0.6;
                                            data?.boost += data.boost * 0.3;
                                          }
                                        }
                                        return data != null
                                            ? Card.fromData(
                                          data,
                                          onBuy: (String? id,
                                              String name,
                                              int lvl,
                                              double cost,
                                              double boost) =>
                                              _showSnackBar(
                                                  context, data.id, name,
                                                  lvl, cost, boost),
                                          onTap: () =>
                                              _navToDetails(context, data),
                                        )
                                            : const SizedBox.shrink(
                                          child: Text("error"),
                                        );
                                      },
                                    );
                                }
                              ),
                            ),
                          );
                        }),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => state.isPaginationLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    context
        .read<HomeBloc>()
        .add(HomeLoadDataEvent(search: searchController.text));
    return Future.value(null);
  }

  void _showSnackBar(BuildContext context, String id, String title, int lvl,
      double cost, double boost) {
    context.read<BuyBloc>().add(ChangeBuyEvent(id));
    final doubleByClick = title.contains("ByClick") ? boost : 0.0;
    final doublePerSec = title.contains("PerSecond") ? boost : 0.0;
    context.read<MainBloc>().add(ChangeMainEvent(-cost, doubleByClick, doublePerSec));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Вы купили $title, увеличив его уровень до ${lvl + 1}, потратили $cost₮, получив улучшение в $boost₮",
            style: Theme.of(context).textTheme.bodyLarge),
        backgroundColor: Color(0xFFE6DDD3),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  void _navToDetails(BuildContext context, CardData data) {
    print("object");
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => DetailsPage(data)));
  }
  void _navToMain(BuildContext context) {
    print("object");
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => MainPage()));
  }
}
