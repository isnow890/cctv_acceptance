import 'dart:convert';
import 'dart:typed_data';


class DataUtils {

  static genderEngToKor(String? value) {
    if (value == "M")
      return "남";
    else if (value == "F") {
      return "여";

    }
    else
      return '';
  }


  static bool toBool(String? value) => value == 'Y' ? true : false;


//Base64 인코딩
  static String plainToBase64(String plain) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(plain);
    return encoded;
  }

  static DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }

  static Uint8List base64Decoder(String encodedImage) {
    return base64.decode(encodedImage);
  }



}
