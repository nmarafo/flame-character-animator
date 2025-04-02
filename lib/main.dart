import 'package:flutter/material.dart';
import 'package:myapp/character_creation_page.dart'; // Asegúrate que esta línea esté

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCharacterApp', // Nombre del proyecto actualizado
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar here as requested initially, just the banner
      body: Column(
        children: <Widget>[
          // Banner Placeholder
          Container(
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              'Banner', // Placeholder text for banner
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Buttons Section
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0), // Increased top padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50), // Larger button size
                  ),
                  onPressed: () {
                    // TODO: Implement Cargar caracteres action
                    print('Cargar caracteres presionado');
                  },
                  child: const Text('Cargar caracteres'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50), // Larger button size
                  ),
                  onPressed: () {
                    // Navigate to the Character Creation Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CharacterCreationPage()),
                    );
                  },
                  child: const Text('Nuevo caracter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
