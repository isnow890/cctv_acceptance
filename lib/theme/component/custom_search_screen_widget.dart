import 'package:cctv_acceptance/theme/component/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../layout/default_layout.dart';
import 'custom_text_form_field.dart';

enum SearchScreenType { search, select }

class CustomSearchScreenWidget extends ConsumerWidget {
  const CustomSearchScreenWidget({
    this.searchScreenType = SearchScreenType.search,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    required this.title,
    required this.onFieldSubmitted,
    required this.searchValueController,
    required this.onPressed,
    required this.body,
    Key? key,
  }) : super(key: key);

  final SearchScreenType searchScreenType;
  final String title;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController searchValueController;
  final VoidCallback? onPressed;
  final Widget body;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      useSliver: true,
      // title: title,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    clearVisible: true,
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    onFieldSubmitted: onFieldSubmitted,
                    // autofocus: true,
                    controller: searchValueController,
                    contentPadding: EdgeInsets.fromLTRB(10, 1, 1, 0),
                    hintText: hintText ?? '검색어를 입력하세요.',

                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                searchScreenType == SearchScreenType.search
                    ? Button(icon: 'search', onPressed: onPressed)
                    : Button(iconData: Icons.check, onPressed: onPressed),
              ],
            ),
            Expanded(
              child: SizedBox(height: 100, child: body),
            )
          ],
        ),
      ),
    );
  }
}
