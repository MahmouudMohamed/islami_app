import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/detalis/sura_detalis.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'detalis/hadeth_detalis.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetalisScreen.routeName: (context) => SuraDetalisScreen(),
        hadethDetalisScreen.routeName: (context) => hadethDetalisScreen(),
      },
    );
  }
}
