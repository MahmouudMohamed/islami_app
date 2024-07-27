import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:islami_app/home/tabs/ahadeth.dart';
import 'package:islami_app/home/tabs/quran.dart';
import 'package:islami_app/home/tabs/radio.dart';
import 'package:islami_app/home/tabs/sebha.dart';
import 'package:islami_app/home/tabs/setting.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

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
    SettingTab()
  ];
}
//ListView.separated(
//                 itemBuilder: (context, index) {
//                   return Text(
//                     suraNames[index],
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.inder(
//                         fontSize: 25, fontWeight: FontWeight.w400),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider(
//                     color: Color(0xFFB7935F),
//                   );
//                 },
//                 itemCount: 114)
