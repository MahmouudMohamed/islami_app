import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../../tabs/Setting Tab/provider/my_provider.dart';
import '../provider/hadeth_detalis_provider.dart';
import 'hadeth_detalis.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethDetalisProvider()..loadHadethFiles(),
      builder: (context, child) {
        var p = Provider.of<HadethDetalisProvider>(context);
        var proBack = Provider.of<MyProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/image/HadithCardBackGroundWhite.png",
              color: proBack.mode == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            const Divider(),
            Text(
              "ahadeth".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(),
            Expanded(
                child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: WidgetStateColor.transparent,
                  onTap: () {
                    Navigator.pushNamed(context, hadethDetalisScreen.routeName,
                        arguments: p.allAhageth[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: proBack.mode == ThemeMode.light
                          ? MyThemeData.primaryColor.withOpacity(0.8)
                          : MyThemeData.primaryDarkColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "hadith".tr(),
                          // p.allAhageth[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          " ${index + 1}",
                          // p.allAhageth[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: p.allAhageth.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 80,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
            ))
          ],
        );
      },
    );
  }
}
