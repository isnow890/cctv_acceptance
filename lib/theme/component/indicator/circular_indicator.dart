import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/theme_provider.dart';

class CircularIndicator extends ConsumerWidget {
  const CircularIndicator({
    super.key,
    // required this.child,
    // required this.isBusy,
  });

  // final Widget child;
  // final bool isBusy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);
    return Stack(
      children: [
        // child,

        /// CircularIndicator
        IgnorePointer(
          ignoring: true,
          // ignoring: !isBusy,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 222),
            opacity: 1,
            child: Container(
              // color: theme.color.background,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: theme.color.primary,
                value: null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
