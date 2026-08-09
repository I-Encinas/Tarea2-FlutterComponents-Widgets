
import 'package:flutter/material.dart';

class InlineDatePicker extends StatefulWidget {
  const InlineDatePicker({super.key});
  @override
  State<InlineDatePicker> createState() => _InlineDatePickerState();
}

class _InlineDatePickerState extends State<InlineDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
          initialDate: _selectedDate,
          firstDate: DateTime(DateTime.now().year - 50),
          lastDate: DateTime(DateTime.now().year + 50),
          onDateChanged: (date) {setState(() => _selectedDate = date);},
        ),
        Text(
          'Fecha elegida: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
