import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/theme_provider.dart';

typedef OnChanged = void Function();

class CustomRadioTile extends ConsumerWidget {
  final String groupValue;
  final Color activeColor;
  final OnChanged onChanged;
  final String value;
  final String title;

  const CustomRadioTile(
      {Key? key,
      required this.groupValue,
      required this.activeColor,
      required this.onChanged,
      required this.value,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      activeColor: theme.color.primary,
      onChanged: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
        onChanged;

        Navigator.of(context).pop();
      },
    );
  }
}
