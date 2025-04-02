import 'package:flutter/material.dart';

class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nuevo Caracter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement image loading logic
                print('Botón Cargar Imagen presionado');
              },
              child: const Text('Cargar Imagen'),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0), // Added margin for visual separation
              color: Colors.grey[300], // Placeholder color
              alignment: Alignment.center,
              child: const Text(
                'Aquí se mostrará la imagen',
                style: TextStyle(color: Colors.black54),
                ), // Placeholder text
            ),
          ),
        ],
      ),
    );
  }
}
