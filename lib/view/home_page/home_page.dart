import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/view/details_page/details_page.dart';
part 'сardView.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: const Body(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class Body extends StatelessWidget {
  const Body({super.key});



  @override
  Widget build(BuildContext context) {
    final data = [
      CardData(name: "ByClickUpgrade 1", cost: 10, imagePath: "assets/ByClick.png", boost: 1, lvl: 1),
      CardData(name: "ByClickUpgrade 2", cost: 1000, imagePath: "assets/ByClick.png", boost: 100, lvl: 1),
      CardData(name: "ByClickUpgrade 3", cost: 100000, imagePath: "assets/ByClick.png", boost: 1000, lvl: 1),
      CardData(name: "PerSecUpgrade 1", cost: 10, imagePath: "assets/PerSecond.png", boost: 1, lvl: 1),
      CardData(name: "PerSecUpgrade 2", cost: 1000, imagePath: "assets/PerSecond.png", boost: 100, lvl: 1),
      CardData(name: "PerSecUpgrade 3", cost: 100000, imagePath: "assets/PerSecond.png", boost: 1000, lvl: 1),
    ];
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: data.map((e)=>
                Card.fromData(
                    e,
                    onBuy: (String title, int lvl, double cost, double boost) => _showSnackBar(context, title, lvl, cost, boost),
                    onTap: () => _navToDetails(context, e),
                ))
                .toList(),
          ),
        )
    );
  }
  void _showSnackBar(BuildContext context, String title,int lvl, double cost, double boost){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
        Text("Вы купили $title, увеличив его уровень до ${lvl+1}, потратили $cost₮, получив улучшение в $boost₮",
            style: Theme.of(context).textTheme.bodyLarge
        ),
        backgroundColor: Color(0xFFE6DDD3),
        duration: const Duration(seconds: 1),
      ));
    });

  }
  void _navToDetails(BuildContext context, CardData data){
    print("object");
    Navigator.push(context, CupertinoPageRoute(builder: (context)=> DetailsPage(data)));
  }

}