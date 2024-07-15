import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetalisScreen extends StatefulWidget {
  static const String routeName = "sura";

  SuraDetalisScreen({super.key});

  @override
  State<SuraDetalisScreen> createState() => _SuraDetalisScreenState();
}

class _SuraDetalisScreenState extends State<SuraDetalisScreen> {
  List<String> showSura = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (showSura.isEmpty) {
      loadSuraFile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/image/main_bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            model.name,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.all(10),
            color:Color.fromRGBO(248 , 248 , 248, 30),
            elevation: 4,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.transparent)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  "${showSura[index]}[${index+1}]",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black),
                );
              },
              itemCount: showSura.length,
            ),
          ),
        ),
      ),
    );
  }


  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    showSura = suraLines;
    setState(() {});
  }
}
