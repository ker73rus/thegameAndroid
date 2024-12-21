class CardData {
  final String id;
  final String name;
  double cost;
  final String imagePath;
  double boost;
  int lvl;

  CardData(
      {required this.name,
      required this.id,
      required this.cost,
      required this.imagePath,
      required this.boost,
      required this.lvl});
}
