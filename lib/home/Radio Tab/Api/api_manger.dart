import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/home/Radio%20Tab/model/RadioStation.dart';

class ApiManger {

  static Future<RadioStation?> getRadio() async {
    RadioStation? radioStation;
    Uri url = Uri.https(
      "mp3quran.net",
      "api/v3/radios",
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      radioStation = RadioStation.fromJson(jsonDecode(response.body));
      return radioStation;
    }
    return null;
  }
}
