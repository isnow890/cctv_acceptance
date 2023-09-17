import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart'; // 패키지를 import.

import 'router/provider/go_router_provider.dart';
import 'theme/component/constrained_screen.dart';
import 'theme/provider/theme_provider.dart';

void main() async {
  // setPathUrlStrategy();

  runApp(const ProviderScope(child: _App()));
}

class _App extends ConsumerWidget {
  const _App({super.key});

  Future<bool> getSelectedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLightTheme') ?? true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    //material 3 적용
    return FutureBuilder(
        future: getSelectedTheme(),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            ref.read(themeServiceProvider.notifier).toggleTheme();
          }

          return MaterialApp.router(
            useInheritedMediaQuery: true,
            title: '다양한 응답 기록',
            builder: (context, child) {
              return Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => child!,
                  )
                ],
              );
            },
            routerConfig: router,
            theme: ref.read(themeServiceProvider.notifier).themeData,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
