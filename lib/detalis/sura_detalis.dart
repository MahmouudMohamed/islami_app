import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class SuraDetalisScreen extends StatefulWidget {
  static const String routeName = "sura";

  SuraDetalisScreen({super.key});

  @override
  State<SuraDetalisScreen> createState() => _SuraDetalisScreenState();
}

class _SuraDetalisScreenState extends State<SuraDetalisScreen> {
  List<String> showSura = [];

  @override
  Widget build(BuildContext context) {
    var proBack = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (showSura.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
        proBack.mode == ThemeMode.light
            ? "assets/image/main_bg.png"
            : "assets/image/bg_dark.png",
      ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Card(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                "${showSura[index]}[${index + 1}]",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              );
            },
            itemCount: showSura.length,
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    showSura = suraLines;
    setState(() {});
  }
}
