import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/detalis/hadeth_detalis.dart';
import 'package:islami_app/model/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhageth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhageth.isEmpty) {
      loadHadethFiles();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/image/ahadeth.png",
          height: 219,
        ),
        Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style:
          GoogleFonts.elMessiri(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, hadethDetalisScreen.routeName,
                        arguments: allAhageth[index]);
                  },
                  child: Column(
                    children: [
                      Text(
                        "الحديث رقم ${ index + 1}",
                        // "${allAhageth[index].title}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inder(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Color(0xFFB7935F),
                      ),
                    ],
                  ),

                );
              },
              itemCount: allAhageth.length,
            ))
      ],
    );
  }

  loadHadethFiles() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
          (value) {
        List<String> ahadeth = value.split("#");
        for (int i = 0; i < ahadeth.length; i++) {
          String hadethOne = ahadeth[i];
          List<String> hadethLines = hadethOne.trim().split("\n");
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          HadethModel hadethModel = HadethModel(title, content);
          allAhageth.add(hadethModel);
        }
        setState(() {

        });
      },
    );
  }
}
