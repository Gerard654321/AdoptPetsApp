import 'package:flutter/material.dart';

class RescueScreen extends StatefulWidget {
  const RescueScreen({super.key});

  @override
  State<RescueScreen> createState() => _RescueScreenState();
}

class _RescueScreenState extends State<RescueScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedType;
  String? _location;
  String? _description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Rescatar un animal', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Formulario visual — aún sin backend.', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 12),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      // Photo placeholder
                      GestureDetector(
                        onTap: () {},
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 450),
                          height: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
                          child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.camera_alt, size: 36), SizedBox(height: 8), Text('Añadir foto (demo)')])),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(decoration: const InputDecoration(labelText: 'Tipo (Perro/Gato/etc.)')),
                      const SizedBox(height: 8),
                      TextFormField(decoration: const InputDecoration(labelText: 'Ubicación (dirección o referencia)'), onChanged: (v) => _location = v),
                      const SizedBox(height: 8),
                      TextFormField(decoration: const InputDecoration(labelText: 'Descripción'), maxLines: 4, onChanged: (v) => _description = v),
                      const SizedBox(height: 12),
                      Row(children: [
                        Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Cancelar'))),
                        const SizedBox(width: 8),
                        Expanded(child: ElevatedButton(onPressed: () {
                          // visual only: show dialog with entered info
                          showDialog(context: context, builder: (c) => AlertDialog(title: const Text('Preview'), content: const Text('Tipo: \$_selectedType\nUbicación: \$_location\nDescripción: \$_description'), actions: [TextButton(onPressed: () => Navigator.of(c).pop(), child: const Text('Ok'))]));
                        }, child: const Text('Registrar'))),
                      ])
                    ]),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}