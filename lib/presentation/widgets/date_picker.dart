import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/core/app_theme.dart';

import 'package:intl/intl.dart';


class CommonDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? Function(String?)? validator;
  late DateTime? date;
  final Function(DateTime) onChange;


  CommonDatePicker(
      {required this.controller,
      this.title,
      this.validator,
      required this.date,
      required this.onChange, });

  @override
  _CommonDatePickerState createState() => _CommonDatePickerState();
}

class _CommonDatePickerState extends State<CommonDatePicker> {
  late bool hasError;

  @override
  void initState() {
    hasError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.title ?? "",
            style: AppTextStyles.bodyBold,
          ),
        ),
        Center(
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: widget.controller,
            readOnly: true,
            validator: widget.validator,
            onTap: () {
              showDatePicker(
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.primaryBlue, // <-- SEE HERE
                        onPrimary: AppColors.lightGrey, // <-- SEE HERE
                        onSurface: AppColors.primaryBlue, // <-- SEE HERE
                      ),

                    ),
                    child: child!,
                  );
                },
                // confirmText: S.of(context).select,
                context: context,
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2100),
              ).then((value) {
                if (value == null) return;
                widget.onChange(value);
                widget.controller.text = DateFormat('yyyy-MM-dd').format(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
