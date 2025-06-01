import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inovola_task/core/app_theme.dart';

import '../../core/constants.dart';


class CommonTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final String?  title;
  final String? Function(String?)? validator;


  final Function(String)? onChange;
  final bool? isPassword, isNumber,decimal;


  final TextInputType? keyBoardType;

  const CommonTextFiled({
     this.controller,
    required this.onChange,
    this.isPassword = false,
    this.title,
    this.keyBoardType,
    this.validator,
    this.isNumber,
    this.decimal=false,
  });

  @override
  _CommonTextFiledState createState() => _CommonTextFiledState();
}

class _CommonTextFiledState extends State<CommonTextFiled> {
  late bool hasError;

  @override
  void initState() {
    hasError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(widget.title ?? "", style: AppTextStyles.bodyBold),
        ),
        Center(
          child: TextFormField(
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.bottom,
            inputFormatters: widget.isNumber ?? false
                ? widget.decimal??false ?<TextInputFormatter>[FilteringTextInputFormatter.allow(decimalRegex)]:
                <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
            obscureText: widget.isPassword ?? false,
            keyboardType: widget.keyBoardType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: widget.validator,


            onChanged: (text){
              widget.onChange!(text);
            },

          ),
        ),
      ],
    );
  }
}
