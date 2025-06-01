
import 'package:flutter/material.dart';
import 'package:inovola_task/core/app_theme.dart';

import '../../data/models/category/categories.dart';


class CommonDropBox extends StatefulWidget {
  final String title,hint;
  final List<dynamic> items;
  final Function(dynamic) onChange;


  final dynamic itemSelected;
  final bool error;

  const CommonDropBox(
      {Key? key,
        this.hint="",
      required this.title,
      required this.items,
      required this.onChange,
      required this.itemSelected,
        required this.error,})
      : super(key: key);

  @override
  State<CommonDropBox> createState() => _CommonDropBoxState();
}

class _CommonDropBoxState extends State<CommonDropBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.title,
            style: AppTextStyles.bodyBold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: size.width*0.9,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.error?AppColors.errorRed:AppColors.inputBorder)
          ),
          child: DropdownButtonHideUnderline(
            // value: selectedCategory,
            child: DropdownButton(
              hint: Text(widget.hint, style: AppTextStyles.inputHint,),
              value: widget.itemSelected,
              items: widget.items.map((dynamic data) {
                return DropdownMenuItem<dynamic>(
                  value: data,
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: data is Category?data.iconColor:AppColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(data is Category ?data.name:data),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.onChange(value);
                });
              },
            ),
          ),
        ),


      ],
    );
  }
}
