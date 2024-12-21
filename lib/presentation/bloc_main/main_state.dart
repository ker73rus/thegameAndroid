import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:thegame/domain/models/main.dart';

part 'main_state.g.dart';

@CopyWith()
class MainState extends Equatable{
  final MainData data;

  MainState({required this.data});

  @override
  List<Object?> get props => [data];
}