import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/Radio%20Tab/Api/api_manger.dart';
import 'package:islami_app/home/Radio%20Tab/ui/radio_tab.dart';
import 'package:islami_app/utils/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../../tabs/Setting Tab/provider/my_provider.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController? controller = PageController();
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var proBack = Provider.of<MyProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Image.asset(
          "assets/image/radio.png",
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        FutureBuilder(
          future: ApiManger.getRadio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var radiosDats = snapshot.data?.radios ?? [];
              return Expanded(
                  child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RadioTabInfo(
                      player: player,
                      next: () {
                        controller!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      back: () {
                        controller!.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      radios: radiosDats[index],
                    )),
                itemCount: radiosDats.length,
              ));
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            } else {
              snapshot.connectionState==ConnectionState.waiting;
              return Center(
                child: CircularProgressIndicator(
                  color: proBack.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : Colors.yellow,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
