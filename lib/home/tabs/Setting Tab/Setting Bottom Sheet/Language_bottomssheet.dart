import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/theme/my_theme_data.dart';

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
              context.setLocale(const Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: context.locale == const Locale("ar")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: MyThemeData.primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                context.locale == const Locale("ar") ? Icon(Icons.done,color: MyThemeData.primaryColor,) : const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              context.setLocale(const Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("english".tr(),
                    style: context.locale == const Locale("en")
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: MyThemeData.yellowColor)
                        : Theme.of(context).textTheme.bodyLarge),
                context.locale == const Locale("en") ? Icon(Icons.done,color: MyThemeData.yellowColor,) : const SizedBox()
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
