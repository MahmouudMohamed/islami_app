
import 'package:flutter/material.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/detalis/sura_detalis.dart';

import 'detalis/hadeth_detalis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetalisScreen.routeName: (context) => SuraDetalisScreen(),
        hadethDetalisScreen.routeName: (context) => hadethDetalisScreen(),
      },
    );
  }
}
