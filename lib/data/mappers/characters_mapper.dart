import 'package:thegame/data/dtos/character_dto.dart';
import 'package:thegame/domain/models/card.dart';

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
    id: id?.toString() ?? "",
        name: attributes?.name ?? "Unknown",
        cost: 0,
        imagePath: "",
        boost: 0,
        lvl: 0,
      );
}
