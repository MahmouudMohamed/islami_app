import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';
import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var proTheme=Provider.of<MyProvider>(context);
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
                  proTheme.mode == ThemeMode.light ?
                  Text(
                    "Light",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MyThemeData.primaryColor),
                  ):  Text(
                      "Light",style: Theme.of(context).textTheme.bodyLarge
                  ),
                  proTheme.mode == ThemeMode.light? Icon(Icons.done,color: MyThemeData.primaryColor,):SizedBox()
                ],
              ),
            ),
            SizedBox(
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
                  Text(
                    "Dark",
                    style: Theme.of(context).textTheme.displayLarge),
                  proTheme.mode == ThemeMode.dark ? Icon(Icons.done):SizedBox()
                ],
              ),
            ),
          ],
        ));
  }
}
