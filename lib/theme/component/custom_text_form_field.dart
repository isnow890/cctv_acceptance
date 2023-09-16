import 'package:cctv_acceptance/theme/component/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/theme_provider.dart';

typedef Validation = String? Function(String?)?;

class CustomTextFormField extends ConsumerStatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final void Function()? onClear;

  final bool clearVisible;
  final void Function(String text)? onChanged;
  final void Function(String text)? onFieldSubmitted;

  final bool? readOnly;

  final TextEditingController? controller;
  final String? initialValue;

  final Icon? prefixIcon;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  final String? labelText;

  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final int? maxLines;
  final Function? scrollAnimate;

  const CustomTextFormField(
     {
       this.scrollAnimate,
    this.clearVisible = false,
    Key? key,
    this.onClear,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.contentPadding,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly,
    this.onFieldSubmitted,
    this.validator,
    this.labelText,
    this.onSaved,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  ConsumerState<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends ConsumerState<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeServiceProvider);

    //텍스트 필드 Border를 모든 면에 적용함.

    return TextFormField(
      onTap: () {
        if (widget.scrollAnimate != null) {
          widget.scrollAnimate!();
        }
      },
      maxLines: widget.maxLines,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly ?? false,

      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      //화면에 들어가자마자 포커스를 자동을 넣어줄지 여부
      autofocus: widget.autofocus,
      //비밀번호 작성시 사용.
      obscureText: widget.obscureText,
      //커서 컬러
      // cursorColor: PRIMARY_COLOR,
      //커서 시작 부분 밀기.
      style: theme.typo.subtitle1,

      onSaved: widget.onSaved,

      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 11.5,
              horizontal: 16,
            ),
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        errorText: widget.errorText,
        labelText: widget.labelText,
        labelStyle: theme.typo.headline5,
        //힌트 스타일
        hintStyle: theme.typo.subtitle1.copyWith(
          fontWeight: theme.typo.light,
          color: theme.color.onHintContainer,
        ),
        fillColor: widget.readOnly ?? false
            ? theme.color.inactiveContainer
            : theme.color.hintContainer,
        //false - 배경색 없음
        //true - 배경색 있음
        // filled: widget.readOnly??false ? false :true,
        filled: true,
        //모든 Input 상태의 기본 스타일 세팅

        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: theme.color.inactiveContainer,
          ),

          /// 테두리 둥글게
          borderRadius: BorderRadius.circular(10),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: theme.color.inactiveContainer,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: theme.color.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.controller == null
            ? null
            : widget.controller!.text.isEmpty || !widget.clearVisible
                ? null
                : Button(
                    icon: 'close',
                    type: ButtonType.flat,
                    onPressed: () {
                      setState(() {
                        widget.controller!.clear();
                        widget.onClear?.call();
                      });
                    },
                  ),
      ),
    );
  }
}
