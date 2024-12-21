import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thegame/domain/models/main.dart';
import 'package:thegame/presentation/bloc_main/main_event.dart';
import 'package:thegame/presentation/bloc_main/main_state.dart';
import 'package:thegame/presentation/buy_bloc/buy_event.dart';
import 'package:thegame/presentation/buy_bloc/buy_state.dart';

class MainBloc extends Bloc<MainEvent,MainState>{
  MainBloc(): super(MainState(data: MainData.new(20, 1, 1))){
    on<ChangeMainEvent>(_onChangeMain);
    on<LoadMainEvent>(_onLoadMain);
  }

  Future<void> _onLoadMain(LoadMainEvent event, Emitter<MainState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final score = double.parse(prefs.getString("score") ?? "0.0");
    final byClick = double.parse(prefs.getString("byClick") ?? "1.0");
    final perSecond = double.parse(prefs.getString("perSecond") ?? "1.0");
    emit(state.copyWith(data: MainData(score, byClick, perSecond)));
  }
  Future<void> _onChangeMain(ChangeMainEvent event, Emitter<MainState> emit) async {
    final upgradedData = state.data;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("score", upgradedData.score.toStringAsFixed(2));
    prefs.setString("byClick", upgradedData.byClick.toStringAsFixed(2));
    prefs.setString("perSecond", upgradedData.perSecond.toStringAsFixed(2));
    emit(state.copyWith(data: upgradedData));
  }

}