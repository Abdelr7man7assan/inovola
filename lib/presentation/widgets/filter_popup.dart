import 'package:flutter/material.dart';
import 'package:inovola_task/core/app_theme.dart';

  enum FilterType { lastMonth, lastWeek, withoutFilters }
class ShowFilerPopup extends StatelessWidget {

  final Function(FilterType) onPressed;
  const ShowFilerPopup({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<FilterType>(
      color: AppColors.background,
      child: const Icon(
        Icons.filter_alt_outlined,
        color: AppColors.cardBlue,
      ),
      onSelected: (FilterType result)  {
        onPressed(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterType>>[
        const PopupMenuItem<FilterType>(
          value: FilterType.lastMonth,
          child: Text(
            "Last Month",
            style: AppTextStyles.bodyRegular,
          ),
        ),
        const PopupMenuItem<FilterType>(
          value: FilterType.lastWeek,
          child: Text(
            "Last Week",
            style: AppTextStyles.bodyRegular,
          ),
        ),
        const PopupMenuItem<FilterType>(
          value: FilterType.withoutFilters,
          child: Text(
            "Without Filters",
            style: AppTextStyles.bodyRegular,
          ),
        ),

      ],
    );
  }
}


