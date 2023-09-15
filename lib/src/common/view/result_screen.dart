import 'package:cctv_acceptance/theme/layout/default_layout.dart';
import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/component/custom_divider.dart';

class ResultScreen extends ConsumerWidget {
  ResultScreen({
    required this.title,
    required this.detail,
    this.result,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? result;
  final String detail;

  static String get routeName => 'result';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return DefaultLayout(
        useSliver: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: theme.color.hintContainer,
                    border: Border.all(
                      color: theme.color.inactiveContainer,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          title,
                          style: theme.typo.headline1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomDivider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Visibility(
                            visible: result != null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result ?? '',
                                  style: theme.typo.headline2.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )),
                        Text(
                          detail,
                          style: theme.typo.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
