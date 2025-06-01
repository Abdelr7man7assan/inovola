
import 'package:flutter/material.dart';
import 'package:inovola_task/core/app_theme.dart';

class ExpenseTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double amount;
  final double  usdAmount;
  final String time;
  final String currency;
  final Color color;

  const ExpenseTile({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.usdAmount,
    required this.time,
    required this.color,
    required this.currency
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.titleMedium),
                const Text("Manually",
                    style:  AppTextStyles.bodyRegular),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text("- $amount $currency", style: AppTextStyles.titleMedium),
                  Text("- $usdAmount\$", style: AppTextStyles.titleMedium)
                ],
              ),
              Text(time,
                  style:  AppTextStyles.bodyRegular),
            ],
          ),
        ],
      ),
    );
  }
}