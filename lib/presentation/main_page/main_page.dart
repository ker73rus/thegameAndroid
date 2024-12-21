import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/presentation/bloc_main/main_bloc.dart';
import 'package:thegame/presentation/bloc_main/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE6DDD3),
            border: Border.all(color: Color(0xFF000000), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(5),
          child: BlocBuilder<MainBloc,MainState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      children: [
                        Text("Очков: ${state.data.score}", style: Theme.of(context).textTheme.headlineSmall, ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      children: [
                        Text("В секунду: ${state.data.perSecond}", style: Theme.of(context).textTheme.headlineSmall,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      children: [
                        Text("За клик: ${state.data.byClick}", style: Theme.of(context).textTheme.headlineSmall,),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      width: 400,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
