import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/home/Quran%20Tab/ui/sura_detalis.dart';
import 'package:islami_app/utils/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

import 'home/Ahadeth Tab/ui/hadeth_detalis.dart';
import 'home/tabs/Setting Tab/provider/my_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider()..getTheme(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        saveLocale: true,
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    // provider.getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetalisScreen.routeName: (context) => SuraDetalisScreen(),
        hadethDetalisScreen.routeName: (context) => const hadethDetalisScreen(),
      },
    );
  }
}
