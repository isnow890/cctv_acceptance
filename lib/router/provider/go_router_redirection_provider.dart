import 'package:cctv_acceptance/src/common/view/result_screen.dart';
import 'package:cctv_acceptance/src/cctv/view/cctv_response_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/data.dart';
import 'go_router_provider.dart';

final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

List<RouteBase> get routes => [
      GoRoute(
        path: '/result',
        parentNavigatorKey: navigatorKey,
        name: ResultScreen.routeName,
        builder: (context, state) {
          return ResultScreen(
              title: WRONG_PAGE_TITLE, detail: WRONG_PAGE_DETAIL);
        },
      ),

      // GoRoute(
      //   path: '/result',
      //   parentNavigatorKey: navigatorKey,
      //   name: ResultScreen.routeName,
      //   builder: (context, state) {
      //     return ResultScreen(
      //       result: '제출 완료',
      //       title: '수술장면 촬영 요청 알림',
      //       detail: '감사합니다. 응답이 기록되었습니다.',
      //     );
      //   },
      // ),

      GoRoute(
        path: '/cctv/:HSP_TP_CD/:REQ_ID/:SID',
        parentNavigatorKey: navigatorKey,
        name: CctvResponseScreen.routeName,
        builder: (context, state) {
          return CctvResponseScreen(
            HSP_TP_CD: state.pathParameters['HSP_TP_CD'].toString(),
            REQ_ID: state.pathParameters['REQ_ID'].toString(),
            SID: state.pathParameters['SID'].toString(),
          );
        },
      ),
      // GoRoute(
      //   path: '/cctvOk',
      //   parentNavigatorKey: navigatorKey,
      //   name: CctvOkScreen.routeName,
      //   builder: (context, state) {
      //     return CctvOkScreen(
      //       post: state.extra == null ? null : state.extra as PostModel,
      //     );
      //   },
      // ),
    ];

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// WidgetsBinding.instance!.addPostFrameCallback((_) {
// ref
//     .read(drawerSelectProvider.notifier)
//     .update((state) => MealScreen.routeName);
// });
