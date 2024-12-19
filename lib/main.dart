import 'package:flutter/material.dart';
import 'package:thegame/view/home_page/home_page.dart';

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





