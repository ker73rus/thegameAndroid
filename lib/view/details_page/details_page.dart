import 'package:flutter/material.dart';
import 'package:thegame/domain/models/card.dart';

class DetailsPage extends StatelessWidget {
  final CardData data;
  const DetailsPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                  image: AssetImage(data.imagePath),
                  errorBuilder: (_,__,___) => const Placeholder(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${data.name} (lvl ${data.lvl})",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                  ), Text(
                      "+${data.boost} ₮",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                  ), Text(
                    "${data.cost} ₮",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),

                ],
              ),
            ),
          ],
        ),
      )
      );
  }
}
