import 'package:get/get.dart';

class lang extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      "title":"English",
      "change":"تحويل الى العربية"
    },
    'ar_JO':{
      "title":"عربي",
      "change":"Change to English"
    }
  };
}