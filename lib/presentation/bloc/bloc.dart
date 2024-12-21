import 'package:thegame/data/repositories/api_interface.dart';
import 'package:thegame/data/repositories/thegame_repository.dart';
import 'package:thegame/presentation/bloc/events.dart';
import 'package:thegame/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiInterface repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<HomeLoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit) async {
    if (event.nextPageNumber == null) {
      emit(state.copyWith(isLoading: true, page: event.pageNumber ?? 1));
    } else {
      emit(state.copyWith(isPaginationLoading: true, page: event.pageNumber ?? 1));
    }

    String? error;

    final data = await repo.loadData(
      q: event.search,
      pageNumber: event.nextPageNumber ?? 1,
      onError: (e) => error = e,
    );

    emit(state.copyWith(
        isLoading: false,
        isPaginationLoading: false,
        data: data,
        error: error,
        page: event.nextPageNumber ?? 1));
  }
}
