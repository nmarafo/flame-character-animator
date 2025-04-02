import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts
import 'package:myapp/character_creation_page.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Character Animator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Apply Roboto font as the default text theme
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        // Apply Roboto font to elevated button text specifically if needed
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
             textStyle: GoogleFonts.roboto(), // Use Roboto for buttons
          )
        )
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
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              'Banner', 
              // The theme will apply Roboto here, but you could be explicit:
              // style: GoogleFonts.roboto(color: Colors.white, fontSize: 24), 
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50), 
                  ),
                  onPressed: () {
                    print('Cargar caracteres presionado');
                  },
                  // Text widget inherits font from ElevatedButton's textStyle 
                  child: const Text('Cargar caracteres'), 
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50), 
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CharacterCreationPage()),
                    );
                  },
                  // Text widget inherits font from ElevatedButton's textStyle
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
