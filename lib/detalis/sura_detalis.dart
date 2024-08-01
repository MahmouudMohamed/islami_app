import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:provider/provider.dart';
import '../providers/Sura_detalis_provider.dart';
import '../providers/my_provider.dart';

class SuraDetalisScreen extends StatelessWidget {
  static const String routeName = "sura";

  SuraDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var proBack = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
      create: (context) => SuraDetalisProvider()..loadSuraFile(model.index),
      builder: (context, child) =>Container(
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
                  "${Provider.of<SuraDetalisProvider>(context).showSura[index]}[${index + 1}]",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
              itemCount: Provider.of<SuraDetalisProvider>(context).showSura.length,
            ),
          ),
        ),
      ),
    );
  }
}
