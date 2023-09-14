import 'package:intl/intl.dart';

extension InputValidate on String {
  //이메일 포맷 검증
  bool isValidEmailFormat() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  //대쉬를 포함하는 010 휴대폰 번호 포맷 검증 (010-1234-5678)
  bool isValidPhoneNumberFormat() {
    return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(this);
  }
}

extension Convert on DateTime? {
  String datetimeToString() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return this == null ? '' : formatter.format(this!);
  }

  String datetimeToStringSpecifically() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    return this == null ? '' : formatter.format(this!);
  }
}
