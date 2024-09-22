import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:islami_app/home/Quran%20Tab/ui/quran.dart';
import 'package:islami_app/home/tabs/Setting%20Tab/provider/my_provider.dart';
import 'package:islami_app/home/Radio%20Tab/ui/radio.dart';
import 'package:islami_app/home/tabs/sebha.dart';
import 'package:islami_app/home/tabs/Setting%20Tab/setting.dart';
import 'package:provider/provider.dart';

import 'Ahadeth Tab/ui/ahadeth.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var proBack = Provider.of<MyProvider>(context);
    return Stack(
        children: [
      Image.asset(
        proBack.mode == ThemeMode.light?
        "assets/image/main_bg.png":"assets/image/bg_dark.png",
        fit: BoxFit.fill,width: double.infinity,),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "islami".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/moshaf_light.png")),
                label: "quran".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/ahadeth_light.png")),
                label: "ahadeth".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/sebha_light.png")),
                label: "sebha".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/radio_light.png")),
                label: "radio".tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "setting".tr(),
              ),
            ]),
        body: tabs[index],
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranTabs(),
    AhadethTab(),
    SebhaTab(),
     RadioTab(),
    const SettingTab()
  ];
}
