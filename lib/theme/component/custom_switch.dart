import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({
    required this.onChanged,
    required this.value,
    super.key,
  });

  final void Function(bool value) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return Switch(
      activeColor: theme.color.primary,
      value: value,
      onChanged: onChanged,
    );
  }
}
