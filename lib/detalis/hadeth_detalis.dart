import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/hadeth_model.dart';

class hadethDetalisScreen extends StatelessWidget {
  static const String routeName = "hadeth";

  const hadethDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;

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
            model.title,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.all(15),
            color: Color.fromRGBO(248, 248, 248, 30),
            elevation: 4,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.transparent)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  model.content[index],
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black),
                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
