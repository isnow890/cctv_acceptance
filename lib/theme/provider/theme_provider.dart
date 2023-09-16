import 'package:cctv_acceptance/src/shared_preference.dart';
import 'package:cctv_acceptance/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dark_theme.dart';
import '../foundation/app_theme.dart';

final themeServiceProvider = NotifierProvider<ThemeService, AppTheme>(() {
  return ThemeService();
});

class ThemeService extends Notifier<AppTheme> {
  bool isLightTheme = true;

  @override
  AppTheme build() {
    // TODO: implement build

    return LightTheme();
  }

  void toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(
        'isLightTheme', state.brightness == Brightness.light ? false : true);
    state = state.brightness == Brightness.light ? DarkTheme() : LightTheme();
  }

  ThemeData get themeData {
    return ThemeData(

        /// Scaffold
        scaffoldBackgroundColor: state.color.surface,
        // fontFamily: 'NotoSansKR',

        /// AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: state.color.surface,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: state.color.text,
          ),
          titleTextStyle: state.typo.headline2.copyWith(
            color: state.color.text,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ));
  }

  /// Material ThemeData 커스텀
// ThemeData get themeData {
//   return ThemeData(
//
//       /// Scaffold
//       scaffoldBackgroundColor: state.color.surface,
//       // fontFamily: 'NotoSansKR',
//
//       /// AppBar
//       appBarTheme: AppBarTheme(
//         backgroundColor: state.color.surface,
//         elevation: 0,
//         centerTitle: false,
//         iconTheme: IconThemeData(
//           color: state.color.text,
//         ),
//         titleTextStyle: state.typo.headline2.copyWith(
//           color: state.color.text,
//         ),
//       ),
//       bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: Colors.transparent,
//       ));
// }
}
