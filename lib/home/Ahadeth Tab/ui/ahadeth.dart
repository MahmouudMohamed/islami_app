import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/hadeth_detalis_provider.dart';
import 'hadeth_detalis.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => HadethDetalisProvider()..loadHadethFiles(),
      builder: (context, child) {
        var p=Provider.of<HadethDetalisProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/image/ahadeth.png",
              height: 219,
            ),
            Divider(),
            Text(
              "ahadeth".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(),
            const SizedBox(height: 10,),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, hadethDetalisScreen.routeName,
                            arguments: p.allAhageth[index]);
                      },
                      child: Column(
                        children: [
                          Text(
                            "الحديث رقم ${ index + 1}",
                            // p.allAhageth[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          const SizedBox(height: 25,),
                        ],
                      ),

                    );
                  },
                  itemCount: p.allAhageth.length,
                ))
          ],
        );
      },

    );
  }
}

