import 'package:flutter/material.dart';
import 'package:islami_app/utils/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

import 'Setting Tab/provider/my_provider.dart';


class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;
  int counter = 0;
  double turns = 0.1;

  List<String> prayNames = [
    "سبحان اللَّهُ",
    "الحمد للَّهِ",
    "لا اللَّهُ إلا اللَّهُ",
    "اللَّهُ أكبر"
  ];

  @override
  Widget build(BuildContext context) {
    var proSebha = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(clipBehavior: Clip.none, children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    turns += 0.01;
                    incrementPrayer();
                  });
                },
                child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: 10),
                    child: Image(
                        image: AssetImage(proSebha.mode == ThemeMode.light
                            ? 'assets/image/body_light.png'
                            : 'assets/image/body_dark.png')))),
            Positioned(
                top: -78,
                right: 60,
                child: Image(
                    image: AssetImage(proSebha.mode == ThemeMode.light
                        ? 'assets/image/head_light.png'
                        : 'assets/image/head_dark.png')))
          ]),
          const SizedBox(height: 20,),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: proSebha.mode == ThemeMode.light
                    ? Color.fromRGBO(183, 147, 95, 100)
                    : Color(0xff141A2E)),
            child: Center(
                child: Text(
              counter.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: incrementPrayer,
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: proSebha.mode == ThemeMode.light
                      ? Color(0xffB7935F)
                      : MyThemeData.yellowColor),
              child: Center(
                  child: Text(
                prayNames[index],
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: MyThemeData.blackColor),
              )),
            ),
          ),
        ],
      ),
    );
  }

  incrementPrayer() {
    setState(() {
      counter++;
      if (counter == 33) {
        index++;
        counter = 0;
      }
      if (index == prayNames.length) {
        index = 0;
        counter = 0;
      }
      // else if (counter==33&&index==2){
      //   index++;
      //   counter=0;
      // }
      // else if (counter==33&&index==3){
      //   index=0;
      //   counter=0;
      // }
    });
  }
}
