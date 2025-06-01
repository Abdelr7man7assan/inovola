import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const Category( {
    required this.id,
    required this.name,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });
}