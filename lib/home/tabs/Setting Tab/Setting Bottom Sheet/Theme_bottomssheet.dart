import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/theme/my_theme_data.dart';
import '../provider/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var proTheme = Provider.of<MyProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Text("light".tr(),
                          style: proTheme.mode == ThemeMode.light
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: MyThemeData.primaryColor)
                              : Theme.of(context).textTheme.bodyLarge),
                       proTheme.mode == ThemeMode.light
                          ? Icon(
                              Icons.done,
                              color: MyThemeData.primaryColor,
                            )
                          : const SizedBox()
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.dark);
                Navigator.pop(context);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("dark".tr(),
                      style: Theme.of(context).textTheme.displayLarge),
                  proTheme.mode == ThemeMode.dark
                      ? Icon(Icons.done,color: MyThemeData.yellowColor,)
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ));
  }
}
