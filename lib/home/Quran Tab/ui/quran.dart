import 'package:flutter/material.dart';
import 'package:islami_app/home/Quran%20Tab/ui/custom_quran.dart';

class QuranTabs extends StatelessWidget {
  QuranTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/image/quran.png",
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CustomQuran(index: index);
                },
                separatorBuilder: (context, index) {
                  return const Divider(endIndent: 50,indent: 50,);
                },
                itemCount: CustomQuran.suraNames.length)),
        // Expanded(
        //     flex: 7,
        //     child: Stack(
        //       children: [
        //         Column(
        //           children: [
        //             Divider(),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 Text(
        //                   "ayat".tr(),
        //                   style: GoogleFonts.elMessiri(
        //                       fontWeight: FontWeight.w600, fontSize: 25),
        //                 ),
        //                 Text(
        //                   "sura_name".tr(),
        //                   style: GoogleFonts.elMessiri(
        //                       fontWeight: FontWeight.w600, fontSize: 25),
        //                 ),
        //               ],
        //             ),
        //             Divider(),
        //             Expanded(
        //                 child: ListView.builder(
        //                     itemBuilder: (context, index) {
        //                       return GestureDetector(
        //                         onTap: () {
        //                           Navigator.pushNamed(
        //                               context, SuraDetalisScreen.routeName,
        //                               arguments:
        //                                   SuraModel(suraNames[index], index));
        //                         },
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             Expanded(
        //                               child: Column(
        //                                 children: [
        //                                   Text(
        //                                     "${ayaNumber[index].toString()}",
        //                                     textAlign: TextAlign.center,
        //                                     style: Theme.of(context)
        //                                         .textTheme
        //                                         .bodyMedium,
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               height: 45,
        //                             ),
        //                             Expanded(
        //                               child: Column(
        //                                 children: [
        //                                   Text(
        //                                     "${suraNames[index]}",
        //                                     textAlign: TextAlign.center,
        //                                     style: Theme.of(context)
        //                                         .textTheme
        //                                         .bodyMedium,
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     },
        //                     itemCount: suraNames.length)),
        //           ],
        //         ),
        //         Center(
        //             child: VerticalDivider(
        //           indent: 9.5,
        //         )),
        //       ],
        //     ))
      ],
    );
  }


}
