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
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.light);
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
                  Icon(Icons.done)
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                proTheme.ChangeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                    style: Theme.of(context).textTheme.displayLarge),
                  // Icon(Icons.done)
                ],
              ),
            ),
          ],
        ));
  }
}
