import 'package:components_application/models/form_component.dart';
import 'package:flutter/material.dart';

class WidgetList {
  static List<FormComponent> getFormWidgets() {
    return [
      FormComponent(
        label: 'CalendarDatePicker',
        icon: Icons.calendar_today_outlined,
        customContent: const InlineDatePicker(),
        description: 'Selecciona una fecha usando el calendario',
      ),
      FormComponent(
        label: 'showTimePicker',
        icon: Icons.access_time_outlined,
        customContent: const InlineTimePicker(),
        description: 'Selecciona una hora del día',
      ),
    ];
  }
}

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

class InlineTimePicker extends StatefulWidget {
  const InlineTimePicker({super.key});

  @override
  State<InlineTimePicker> createState() => _InlineTimePickerState();
}

class _InlineTimePickerState extends State<InlineTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white, 
            ),          
            onPressed: () async {
            final picked = await showTimePicker(
              context: context, initialTime: _selectedTime,
            );
            if (picked != null) setState(() => _selectedTime = picked);
          },
          icon: const Icon(Icons.alarm),
          label: const Text('Configurar Hora'),
          
        ),
        const SizedBox(height: 10),
        Text('Hora elegida: ${_selectedTime.format(context)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
