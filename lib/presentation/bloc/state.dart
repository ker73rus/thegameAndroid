import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/domain/models/home.dart';

part 'state.g.dart';

@CopyWith()
class HomeState extends Equatable {
  final HomeData? data;
  final bool isLoading;
  final bool isPaginationLoading;
  final int? page;
  final String? error;

  const HomeState({
    this.page,
    this.data,
    this.isLoading = false,
    this.isPaginationLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [data, isLoading, isPaginationLoading, error, page];
}
