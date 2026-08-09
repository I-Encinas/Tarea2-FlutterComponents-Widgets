import 'package:components_application/widgets/widget_list.dart';
import 'package:components_application/models/form_component.dart';
import 'package:flutter/material.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  void _showWidgetModal(BuildContext context, FormComponent component) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(component.icon, color: Colors.blueAccent),
                    Expanded(
                      child: Text(component.label,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                      ),
                    ),
                  ],
                ),
                component.customContent,
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    label: const Text('Cerrar'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<FormComponent> widgetList = WidgetList.getFormWidgets();
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario Dinámico In-Situ')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold)),),
                    Expanded(flex: 3, child: Text('Descripción', style: TextStyle(fontWeight: FontWeight.bold)),),
                    Expanded(flex: 1, child: Text('Probar',textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: widgetList.length,
                  separatorBuilder: (_, __) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final component = widgetList[index];
                    return Container(
                      padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 2, child: Text(component.label),),
                          Expanded(flex: 3,
                            child: Text(component.description.isEmpty? 'Sin descripción' : component.description,
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          Expanded(flex: 1,
                            child: IconButton(icon: Icon(component.icon, color: Colors.blueAccent),
                              onPressed: () => _showWidgetModal(context, component),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}