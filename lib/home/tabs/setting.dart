import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../../Setting Bottom Sheet/Language_bottomssheet.dart';
import '../../Setting Bottom Sheet/Theme_bottomssheet.dart';
import '../../providers/my_provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var proText=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text("theme".tr(),style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 10,),
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
              child: Text(proText.mode== ThemeMode.light?"light".tr():"dark".tr(),style: Theme.of(context).textTheme.displayLarge,),
            ),
          ),
          SizedBox(height: 40,),
          Text("language".tr(),style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
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
              child: Text(context.locale == Locale("ar")?"arabic".tr():"english".tr(),style: Theme.of(context).textTheme.displayLarge,),
            ),
          ),
        ],
      ),
    );
  }
}
