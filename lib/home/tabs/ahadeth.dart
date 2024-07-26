import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/detalis/hadeth_detalis.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/providers/hadeth_detalis_provider.dart';
import 'package:provider/provider.dart';

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
              "Ahadeth",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(),
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

                          Divider(),
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

