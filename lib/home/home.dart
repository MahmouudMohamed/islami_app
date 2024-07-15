import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/ahadeth.dart';
import 'package:islami_app/home/tabs/quran.dart';
import 'package:islami_app/home/tabs/radio.dart';
import 'package:islami_app/home/tabs/sebha.dart';
import 'package:islami_app/home/tabs/setting.dart';

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
    return Stack(
        children: [
      Image.asset("assets/image/main_bg.png"),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Islami",
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/moshaf_light.png")),
                label: "Quran",
                backgroundColor: Color(0xffB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/ahadeth_light.png")),
                label: "Ahadeth",
                backgroundColor: Color(0xffB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/sebha_light.png")),
                label: "",
                backgroundColor: Color(0xffB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/image/radio_light.png")),
                label: "Radio",
                backgroundColor: Color(0xffB7935F),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "",
                backgroundColor: Color(0xffB7935F),
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
