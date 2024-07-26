import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';

import '../../Setting Bottom Sheet/Language_bottomssheet.dart';
import '../../Setting Bottom Sheet/Theme_bottomssheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Theme",style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ThemeBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("Light",style: Theme.of(context).textTheme.displayLarge,),
            ),
          ),
          SizedBox(height: 40,),
          Text("Language",style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context,
                builder: (context) => LanguageBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("English",style: Theme.of(context).textTheme.displayLarge,),
            ),
          ),





        ],
      ),
    );
  }
}
