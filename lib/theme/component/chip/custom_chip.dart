import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomChip extends ConsumerWidget {
  const CustomChip({
    this.canDelete = true,
    this.onDeleted,
    required this.onTap,
    super.key,
    required this.title,
    this.paddingHorizontal=9.0,
  });

  final bool canDelete;
  final void Function() onTap;
  final void Function()? onDeleted;
  final String title;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: GestureDetector(
        onTap : onTap,
        behavior: HitTestBehavior.translucent,
        child: Chip(
            label: Text(
              title,
              style: theme.typo.body1,
            ),
            backgroundColor: theme.color.hint,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: BorderSide(color: theme.color.onHintContainer),
            ),
            deleteIcon: canDelete
                ? Icon(
                    Icons.close,
                    color: theme.color.primary,
                    size: 15,
                  )
                : null,
            onDeleted: onDeleted),
      ),
    );
  }
}
