part of 'home_page.dart';

typedef OnBuyCallback = void Function(
    String? id, String title, int lvl, double cost, double boost)?;
typedef OnTapCallback = void Function(CardData data)?;

class Card extends StatelessWidget {
  final String name;
  double cost;
  final String imagePath;
  double boost;
  int lvl;
  final OnBuyCallback onBuy;
  final String? id;
  final VoidCallback? onTap;

  Card(
      {required this.name,
      required this.cost,
      required this.boost,
      required this.lvl,
      this.imagePath = "assets/empty.png",
      this.onBuy,
      this.id,
      this.onTap});

  factory Card.fromData(CardData data,
          {OnBuyCallback onBuy, VoidCallback? onTap}) =>
      Card(
        name: data.name,
        cost: data.cost,
        boost: data.boost,
        lvl: data.lvl,
        imagePath: data.imagePath,
        onBuy: onBuy,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6DDD3),
          border: Border.all(color: Color(0xFF000000), width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image(
                  image: AssetImage(imagePath),
                  errorBuilder: (_, __, ___) => const Placeholder(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${name} (lvl ${lvl})",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("+${boost.toStringAsFixed(2)} ₮",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "${cost.toStringAsFixed(2)} ₮",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Text("BUY"),
              onTap: () {
                onBuy?.call("", name, lvl, cost, boost);
                lvlUp();
              },
            )
          ],
        ),
      ),
    );
  }

  void lvlUp() {
    lvl++;
    cost += cost * 0.6;
    boost += boost * 0.3;
  }
}
