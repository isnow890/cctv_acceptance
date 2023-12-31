import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CustomSegmentButton extends ConsumerWidget {
  const CustomSegmentButton(
      {Key? key,
      required this.selectionIndex,
      required this.onSegmentTapped,
      required this.children})
      : super(key: key);

  final int selectionIndex;
  final Map<int, Widget> children;

  final void Function(int) onSegmentTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: MaterialSegmentedControl(
                children: children,
                selectedColor: theme.color.primary,
                horizontalPadding: const EdgeInsets.all(0),
                selectionIndex: selectionIndex,
                // borderColor: Colors.grey,
                unselectedColor: theme.color.hintContainer,
                unselectedTextStyle:
                    theme.typo.headline3.copyWith(color: theme.color.primary),
                selectedTextStyle:
                    theme.typo.headline6.copyWith(color: Colors.white),
                // unselectedTextStyle: theme.typo.subtitle1.copyWith(color: ),
                // unselectedTextStyle: TextStyle(color: PRIMARY_COLOR),
                borderWidth: 1.0,
                borderRadius: 6.0,
                borderColor: theme.color.primary,
                verticalOffset: 12.0,
                onSegmentTapped: onSegmentTapped),
          ),
        ),
      ],
    );
  }
}
