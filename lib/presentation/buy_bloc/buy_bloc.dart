import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thegame/presentation/buy_bloc/buy_event.dart';
import 'package:thegame/presentation/buy_bloc/buy_state.dart';
const String _buyedPrefsKey = "buyed";

class BuyBloc extends Bloc<BuyEvent,BuyState>{
  BuyBloc(): super(const BuyState(buyedIds: [], idsToLvl: {})){
    on<ChangeBuyEvent>(_onChangeBuy);
    on<LoadBuyedEvent>(_onLoadBuyed);
  }

  Future<void> _onLoadBuyed(LoadBuyedEvent event, Emitter<BuyState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_buyedPrefsKey) ?? [];
    Map<String,String> map = {};
    for(final id in data){
       map.addAll({id : prefs.getString(id) ?? "1" });
    }
    emit(state.copyWith(buyedIds: data, idsToLvl: map));
  }
  Future<void> _onChangeBuy(ChangeBuyEvent event, Emitter<BuyState> emit) async {
    final updatedList = List<String>.from(state.buyedIds?? []);
    final idsTolvlUpdeted = Map<String,String>.from(state.idsToLvl ?? {});
    if(updatedList.contains(event.id)){
      if(idsTolvlUpdeted.containsKey(event.id)){
        idsTolvlUpdeted[event.id] = (int.parse(idsTolvlUpdeted[event.id] ?? "1") + 1).toString();
      }
    }
    else{
      updatedList.add(event.id);
      idsTolvlUpdeted.addAll({event.id : "1"});
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_buyedPrefsKey, updatedList);
    for(final id in updatedList){
      prefs.setString(id, idsTolvlUpdeted[id] ?? "1");
    }
    emit(state.copyWith(buyedIds: updatedList, idsToLvl: idsTolvlUpdeted));
  }

}