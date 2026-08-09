import 'package:flutter/material.dart';

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
