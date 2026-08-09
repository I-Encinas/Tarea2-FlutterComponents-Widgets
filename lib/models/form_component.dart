
import 'package:flutter/material.dart';

class FormComponent {
  final String label;
  final IconData icon;
  final String description;
  final Widget customContent;

  FormComponent({
    required this.label,
    required this.icon,
    required this.customContent, 
    required this.description,
  });
}