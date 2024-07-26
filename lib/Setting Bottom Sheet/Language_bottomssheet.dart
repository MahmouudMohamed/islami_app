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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Arabic",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MyThemeData.primaryColor),),
              Icon(Icons.done)],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("English",
              style: Theme.of(context).textTheme.bodyLarge,),
              // Icon(Icons.done)
            ],
          ),
        ],
      ),
    );
  }
}
