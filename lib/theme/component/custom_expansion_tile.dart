import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomExpansionTile extends ConsumerWidget {
  const CustomExpansionTile({
    required this.children,
    required this.title,
    required this.onExpansionChanged,
    super.key,
    this.initiallyExpanded = false,
  });

  final Widget title;
  final void Function(bool) onExpansionChanged;

  final List<Widget> children;
  final bool initiallyExpanded;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          color: theme.color.hintContainer,
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            shape: Border.all(color: Colors.transparent),
            collapsedIconColor: theme.color.onHintContainer,
            iconColor: theme.color.onHintContainer,
            tilePadding: const EdgeInsets.only(left: 0),
            onExpansionChanged: onExpansionChanged,

            title: title,
            children: <Widget>[
              Column(
                children: [...children],
              )
            ],
          ),
        ));
  }
}
