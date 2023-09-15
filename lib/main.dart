import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart'; // 패키지를 import.

import 'router/provider/go_router_provider.dart';
import 'theme/component/constrained_screen.dart';
import 'theme/provider/theme_provider.dart';

void main() {
  // setPathUrlStrategy();

  runApp(const ProviderScope(child: _App()));
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark) {
      ref.read(themeServiceProvider.notifier).toggleTheme;
    }

    final router = ref.watch(goRouterProvider);

    //material 3 적용
    return Center(
      child: ConstrainedScreen(
        child: MaterialApp.router(
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
        ),
      ),
    );
  }
}
