import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int index = 0;

  int counter = 0;
  double turns=0.1;

  List<String> prayNames = [
    "سبحان اللَّهِ",
    "الحمد للَّهِ",
    "لا اللَّهِ إلا اللَّهِ",
    "اللَّهِ أكبر"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25,),
          Stack(
              clipBehavior: Clip.none,
              children:[
            GestureDetector(
                onTap: (){
                  setState(() {
                    turns+=0.01;
                    incrementPrayer();

                  });
                },
                child: AnimatedRotation(turns: turns,
                duration: Duration(milliseconds: 10),
                child: Image(image: AssetImage('assets/image/body_light.png')))),

            Positioned(
              top: -55,
                right: 85,
                child:
                Image(image: AssetImage('assets/image/head_light.png')))
          ]
          ),
          Text("عدد التسبيحات",style: GoogleFonts.elMessiri(
          fontSize: 25, fontWeight: FontWeight.w600),
      ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 120,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              color: Color.fromRGBO(183, 147, 95, 100),
            ),
            child: Center(
                child: Text(
              counter.toString(),
              style: GoogleFonts.inder(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            )),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: incrementPrayer,
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Color(0xffB7935F)
              ),
              child: Center(
                  child: Text(
                                prayNames[index],
                                style: GoogleFonts.inder(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.black),
                              )),
            ),
          ),


        ],
      ),
    );
  }

  incrementPrayer(){
    setState(() {
      counter++;
      if(counter==33){
        index++;
        counter=0;
      }
      if (index==prayNames.length){
        index=0;
        counter=0;
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
