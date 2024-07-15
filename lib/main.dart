
import 'package:flutter/material.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/sura_detalis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetalisScreen.routeName: (context) => SuraDetalisScreen(),
      },
    );
  }
}
// Expanded(
// child: ListView.builder(
// itemBuilder: (context, index) {
// return Table(
// children: [
// TableRow(children: [
// Text(
// suraNames[index],
// textAlign: TextAlign.center,
// style: GoogleFonts.inder(
// fontSize: 25, fontWeight: FontWeight.w400),
// ),
//
// Text(
// suraNames[index ],
// textAlign: TextAlign.center,
// style: GoogleFonts.inder(
// fontSize: 25, fontWeight: FontWeight.w400),
// ),
// ]),
// ],
// );
// },
//
// itemCount: 114))

//ListView.separated(
//                 itemBuilder: (context, index) {
//                   return Text(
//                     suraNames[index],
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.inder(
//                         fontSize: 25, fontWeight: FontWeight.w400),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider(
//                     color: Color(0xFFB7935F),
//                   );
//                 },
//                 itemCount: 114)