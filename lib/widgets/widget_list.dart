import 'package:components_application/models/widget_component.dart';
import 'package:components_application/widgets/custom_date_picker.dart';
import 'package:components_application/widgets/custom_time_picker.dart';
import 'package:flutter/material.dart';

class WidgetList {
  static List<WidgetComponent> getFormWidgets() {
    return [
      WidgetComponent(
        label: 'CalendarDatePicker',
        icon: Icons.calendar_today_outlined,
        customContent: const InlineDatePicker(),
        description: 'Selecciona una fecha usando el calendario',
      ),
      WidgetComponent(
        label: 'showTimePicker',
        icon: Icons.access_time_outlined,
        customContent: const InlineTimePicker(),
        description: 'Selecciona una hora del día',
      ),
    ];
  }
}
