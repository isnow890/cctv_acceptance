import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomLineByLineBorder extends ConsumerWidget {
  const CustomLineByLineBorder({required this.child, Key? key,}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: theme.color.onToastContainer,
            border: Border.all(
              color: theme.color.inactiveContainer,
              width: 2.0,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}