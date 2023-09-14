
import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

renderContents(
    {bool? isInExpand, required String contents, required WidgetRef ref}) {
  final theme = ref.watch(themeServiceProvider);
  return Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 5),
          Text(
            contents,
            style: isInExpand ?? false
                ? theme.typo.subtitle2
                : theme.typo.subtitle1,
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

renderTitle(
    {bool? isInExpand, required String title, required WidgetRef ref}) {
  final theme = ref.watch(themeServiceProvider);
  return Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 5),
          Text(
            title,
            style: isInExpand ?? false
                ? theme.typo.headline6.copyWith(fontWeight: FontWeight.bold)
                : theme.typo.headline5.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}