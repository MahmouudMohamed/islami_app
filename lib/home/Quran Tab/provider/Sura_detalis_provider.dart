import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

List<String> showSura = [];

class SuraDetalisProvider extends ChangeNotifier {
  List<String> showSura = [];
  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.trim().split("\n");
    showSura = suraLines;
    notifyListeners();
  }




}
