import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../model/hadeth_model.dart';

class HadethDetalisProvider extends ChangeNotifier{
  List<HadethModel> allAhageth = [];
  List<String> content=[];
  List<String> hadethLines=[];
  loadHadethFiles() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
          (value) {
        List<String> ahadeth = value.split("#");
        for (int i = 0; i < ahadeth.length; i++) {
          String hadethOne = ahadeth[i];
          hadethLines = hadethOne.trim().split("\n");
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          content = hadethLines;
          HadethModel hadethModel = HadethModel(title, content);
          allAhageth.add(hadethModel);
          notifyListeners();
        }
      },
    );
  }
}