import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/Quran%20Tab/model/sura_model.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import '../../tabs/Setting Tab/provider/my_provider.dart';
import '../provider/Sura_detalis_provider.dart';
import 'package:quran/quran.dart' as quran;

class SuraDetalisScreen extends StatelessWidget {
  static const String routeName = "sura";

  SuraDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var proBack = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
      create: (context) => SuraDetalisProvider()..loadSuraFile(model.index),
      builder: (context, child) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          proBack.mode == ThemeMode.light
              ? "assets/image/main_bg.png"
              : "assets/image/bg_dark.png",
        ))),
        child: Scaffold(
          appBar: AppBar(
            // toolbarHeight: MediaQuery.of(context).size.height*0.12,
            title: Column(
              children: [
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // SizedBox(height: 5,),
                // Text(
                //   quran.basmala,
                //   style: GoogleFonts.amiri(fontSize: 25,fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          body: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  model.index == 8
                      ? const SizedBox()
                      : Text(
                          quran.basmala,
                          style: GoogleFonts.amiri(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) {
                      return Text(
                          "${Provider.of<SuraDetalisProvider>(context).showSura[index].trim()} ${getVerseEndSymbol(index + 1)}",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium);
                    },
                    itemCount: Provider.of<SuraDetalisProvider>(context)
                        .showSura
                        .length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
