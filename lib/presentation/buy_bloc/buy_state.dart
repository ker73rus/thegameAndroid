import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'buy_state.g.dart';

@CopyWith()
class BuyState extends Equatable{
  final List<String>? buyedIds;
  final Map<String,String>? idsToLvl;
  const BuyState ( {required this.idsToLvl, required this.buyedIds});

  @override
  List<Object?> get props => [buyedIds, idsToLvl];
}