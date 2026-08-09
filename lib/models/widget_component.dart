
import 'package:flutter/material.dart';

class WidgetComponent {
  final String label;
  final IconData icon;
  final String description;
  final Widget customContent;

  WidgetComponent({
    required this.label,
    required this.icon,
    required this.customContent, 
    required this.description,
  });
}