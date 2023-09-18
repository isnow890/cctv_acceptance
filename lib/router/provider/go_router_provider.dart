import 'dart:math';
import 'package:cctv_acceptance/src/common/view/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../src/data.dart';
import 'go_router_redirection_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(


    routes: routes,
    initialLocation: '/result',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) {
      return  ResultScreen(
          title: WRONG_PAGE_TITLE, detail: WRONG_PAGE_DETAIL);
    },
  );
});
