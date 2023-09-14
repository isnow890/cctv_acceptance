import 'package:cctv_acceptance/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:cctv_acceptance/theme/component/button/button.dart';
import 'package:cctv_acceptance/theme/component/date_picker/custom_cupertino_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CustomDatePickerBottomSheet extends ConsumerStatefulWidget {
  final String? initialDate;
  final void Function(DateTime changedDate) onDateTimeChanged;
  final void Function(DateTime confirmedDate) onDateTimeConfirmed;

  const CustomDatePickerBottomSheet(
    this.initialDate, {
    required this.onDateTimeConfirmed,
    required this.onDateTimeChanged,
    super.key,
  });

  @override
  ConsumerState<CustomDatePickerBottomSheet> createState() =>
      _CustomDatePickerBottomSheetState();
}

class _CustomDatePickerBottomSheetState
    extends ConsumerState<CustomDatePickerBottomSheet> {
  late String initialDate;

  late DateTime confirmedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialDate = widget.initialDate == null
        ? '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().day.toString()}'
        : widget.initialDate!;

    confirmedDate = DateFormat("yyyy-MM-dd").parse(initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Button(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '취소',
                  type: ButtonType.flat),
              Button(
                  onPressed: () {
                    widget.onDateTimeConfirmed(confirmedDate);
                    Navigator.pop(context);
                  },
                  text: '확인',
                  type: ButtonType.flat)
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: CustomCupertinoDatePicker(
            initDateStr: initialDate,
            onDateTimeChanged: (changedDate) {
              setState(() {
                confirmedDate = changedDate;
              });

              widget.onDateTimeChanged(changedDate);
            },
          ),
        ),
      ],
    ));
  }
}
