import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_preference.g.dart';

@riverpod
Future<SharedPreferences> sharedPreference(SharedPreferenceRef ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}
