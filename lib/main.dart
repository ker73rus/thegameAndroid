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
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Card("ByClickUpgrade 1", 100, 1, 1),
            ],
          ),
        )
    );
  }
}

class _Card extends StatelessWidget {
  final String name;
  final int cost;
  final IconData icon;
  final int boost;
  final int lvl;

  const _Card(this.name, this.cost, this.boost, this.lvl,
      {this.icon = Icons.icecream});

  factory _Card.fromData(_CardData data) =>
      _Card(data.name,
        data.cost,
        data.boost,
        data.lvl,
        icon: data.icon,
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(icon),
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
  final IconData icon;
  final int boost;
  final int lvl;

  _CardData(
      {required this.name, required this.cost, required this.icon, required this.boost, required this.lvl});
}