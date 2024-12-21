import 'package:thegame/data/dtos/upgrade_dto.dart';
import 'package:thegame/domain/models/card.dart';

extension UpgradeDataDtoToModel on UpgradeDto {
  CardData toDomain() => CardData(
        id: id?.toString() ?? "1",
        name: name ?? "Unknown",
        cost: cost ?? 1,
        imagePath: imagePath ?? "/assets/empty.png",
        boost: boost ?? 1,
        lvl: lvl ?? 1,

      );
}
