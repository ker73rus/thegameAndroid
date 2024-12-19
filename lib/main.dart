import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const MyHomePage(title: 'Пятаков Кирилл Максимович'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
      body: const UpgradeList(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UpgradeList extends StatelessWidget {
  const UpgradeList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(name: "ByClickUpgrade 1", cost: 10, imagePath: "assets/ByClick.png", boost: 1, lvl: 1),
      _CardData(name: "ByClickUpgrade 2", cost: 1000, imagePath: "assets/ByClick.png", boost: 100, lvl: 1),
      _CardData(name: "ByClickUpgrade 3", cost: 100000, imagePath: "assets/ByClick.png", boost: 1000, lvl: 1),
      _CardData(name: "PerSecUpgrade 1", cost: 10, imagePath: "assets/PerSecond.png", boost: 1, lvl: 1),
      _CardData(name: "PerSecUpgrade 2", cost: 1000, imagePath: "assets/PerSecond.png", boost: 100, lvl: 1),
      _CardData(name: "PerSecUpgrade 3", cost: 100000, imagePath: "assets/PerSecond.png", boost: 1000, lvl: 1),
    ];
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: data.map((e)=> _Card.fromData(e)).toList(),
          ),
        )
    );
  }
}

class _Card extends StatelessWidget {
  final String name;
  final int cost;
  final String imagePath;
  final int boost;
  final int lvl;

  const _Card(this.name, this.cost, this.boost, this.lvl,
      {this.imagePath = "assets/empty"});

  factory _Card.fromData(_CardData data) =>
      _Card(data.name,
        data.cost,
        data.boost,
        data.lvl,
        imagePath: data.imagePath,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        border: Border.all(
            color: Color(0xFF000000),
            width: 2
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image(
              image: AssetImage(imagePath),
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
                    "$name (lvl $lvl)",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                ), Text(
                    "+$boost ₮",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                ), Text(
                  "$cost ₮",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
              ],
            ),
          ),
          Text("BUY", style: Theme
              .of(context)
              .textTheme
              .headlineMedium,)
        ],
      ),
    );
  }
}

class _CardData {
  final String name;
  final int cost;
  final String imagePath;
  final int boost;
  final int lvl;

  _CardData(
      {required this.name, required this.cost, required this.imagePath, required this.boost, required this.lvl});
}