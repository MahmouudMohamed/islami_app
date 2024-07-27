import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: context.locale == Locale("ar")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: MyThemeData.primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                context.locale == Locale("ar") ? Icon(Icons.done,color: MyThemeData.primaryColor,) : SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("english".tr(),
                    style: context.locale == Locale("en")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: MyThemeData.yellowColor)
                        : Theme.of(context).textTheme.bodyLarge),
                context.locale == Locale("en") ? Icon(Icons.done,color: MyThemeData.yellowColor,) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget nameFunction(String text){
    return Text(text);
  }
}
