import 'package:flutter/material.dart';
import 'package:islami_app/providers/hadeth_detalis_provider.dart';
import 'package:provider/provider.dart';
import '../model/hadeth_model.dart';
import '../providers/my_provider.dart';

class hadethDetalisScreen extends StatelessWidget {
  static const String routeName = "hadeth";

  const hadethDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var proBack = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HadethDetalisProvider()..loadHadethFiles(),
      builder: (context, child) {
        var p1 = Provider.of<HadethDetalisProvider>(context);
        return Container(
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage(
                proBack.mode == ThemeMode.light
                    ? "assets/image/main_bg.png"
                    : "assets/image/bg_dark.png",
              ))),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                model.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Card(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    p1.content[index],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                },
                itemCount:p1.content.length,
              ),
            ),
          ),
        );
      },

    );
  }
}
