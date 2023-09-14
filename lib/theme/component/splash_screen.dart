import 'package:cctv_acceptance/theme/component/indicator/circular_indicator.dart';
import 'package:cctv_acceptance/theme/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../provider/theme_provider.dart';

class SplashScreen extends ConsumerWidget {
  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(

      useSliver: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'asset/img/logo/logo.svg',
              width: 230,
              height: 230,
            ),

            //     Image.asset(
            //   'asset/img/logo/img_logo_clinic.png',
            //   // width: MediaQuery
            //   //     .of(context)
            //   //     .size
            //   //     .width / 2,
            // ),
            const SizedBox(
              height: 20,
            ),
            const CircularIndicator(),
          ],
        ),
      ),
    );
  }
}
