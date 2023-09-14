import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFilterButton extends ConsumerStatefulWidget {
   CustomFilterButton({
    required this.onFilterChanged,
    required this.selectedIndex,
    required this.options,
    super.key,
  });

   final int selectedIndex;

  final List<String> options;

  final void Function(int selected) onFilterChanged;

  @override
  ConsumerState<CustomFilterButton> createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends ConsumerState<CustomFilterButton> {
  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeServiceProvider);

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      // 3
      offset: Offset(0, 0),
      icon: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${widget.options[selectedIndex]}", style: theme.typo.subtitle2),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
          onPressed: null,
        ),
      ),

      onSelected: (value) {
        setState(() {
          print('실행');
          print(value.toString());
          selectedIndex = widget.options.indexOf(value);
          widget.onFilterChanged(widget.options.indexOf(value.toString()));
        });
      },
      itemBuilder: (BuildContext context) {
        // 3
        return widget.options
            .map((option) => PopupMenuItem(
                  child: Text("$option", style: theme.typo.subtitle2),
                  value: option,
                ))
            .toList();
      },
    );
  }
}
