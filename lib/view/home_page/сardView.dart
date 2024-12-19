part of 'home_page.dart';

typedef OnBuyCallback = void Function(String title, int lvl, double cost, double boost)?;
typedef OnTapCallback = void Function(CardData data)?;

class Card extends StatefulWidget {
  final String name;
  double cost;
  final String imagePath;
  double boost;
  int lvl;
  final OnBuyCallback onBuy;
  final VoidCallback? onTap;

  Card({required this.name, required this.cost, required this.boost, required this.lvl,
      this.imagePath = "assets/empty.png", this.onBuy, this.onTap});

  factory Card.fromData(CardData data, {OnBuyCallback onBuy, VoidCallback? onTap}) =>
      Card(name: data.name,
        cost: data.cost,
        boost: data.boost,
        lvl: data.lvl,
        imagePath: data.imagePath,
        onBuy: onBuy,
        onTap: onTap,
      );

  @override
  State<Card> createState() => CardState();
}

class CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6DDD3),
          border: Border.all(
              color: Color(0xFF000000),
              width: 2
          ),
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
                  image: AssetImage(widget.imagePath),
                  errorBuilder: (_,__,___) => const Placeholder(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${widget.name} (lvl ${widget.lvl})",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                  ), Text(
                      "+${widget.boost} ₮",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                  ), Text(
                    "${widget.cost} ₮",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),

                ],
              ),
            ),
            GestureDetector(
              child: Text("BUY"),
              onTap: (){
                widget.onBuy?.call(widget.name,widget.lvl, widget.cost, widget.boost);
                lvlUp();
              },
            )
          ],

        ),
      ),
    );
  }
  void lvlUp(){
    widget.lvl++;
    widget.cost+=widget.cost*0.6;
    widget.boost+=widget.boost*0.3;
    setState(() {

    });
  }
}