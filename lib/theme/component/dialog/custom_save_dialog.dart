import 'package:cctv_acceptance/theme/component/button/button.dart';
import 'package:cctv_acceptance/theme/component/dialog/base_dialog.dart';
import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomYesNoDialog extends ConsumerWidget {


  final String dialogTitle;
  final String? yesTitle;
  final String content;
  final void Function() onSave;

  const CustomYesNoDialog( {
    required this.dialogTitle,
    this.yesTitle= '확인',
    required this.content,
    required this.onSave,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return BaseDialog(
      title: dialogTitle,
      content: Text(
        content,
        style: theme.typo.headline6,
      ),

      actions: [
        /// Delete
        Button(
          text: yesTitle,
          width: double.infinity,
          color: theme.color.onPrimary,
          backgroundColor: theme.color.primary,
          onPressed: () {
            context.pop();
            onSave();

          },
        ),
        const SizedBox(height: 12),

        /// Cancel
        Button(
          text: '취소',
          width: double.infinity,
          color: theme.color.text,
          borderColor: theme.color.hint,
          type: ButtonType.outline,
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );  }
}
