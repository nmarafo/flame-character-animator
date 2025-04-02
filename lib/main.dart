import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/skeleton_editor_page.dart';

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
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
             textStyle: GoogleFonts.roboto(), 
          )
        )
      ),
      // Set HomePage as the home screen again
      home: const HomePage(), 
    );
  }
}

// Restore the HomePage widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Banner Placeholder
          Container(
            height: 200, // Or original height
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Flame Character Animator', // Use the title
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Buttons Section
          Padding(
            padding: const EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: <Widget>[
                 Expanded(child: Container()), // Added for centering
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 100), // Or original size
                  ),
                  onPressed: () {
                    // TODO: Implement Cargar caracteres action
                    print('Cargar caracteres presionado');
                  },
                  child: const Text('Cargar\ncaracteres', textAlign: TextAlign.center), // Or original text
                ),
                 SizedBox(width: 32.0), // Added for spacing
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 100), // Or original size
                  ),
                  onPressed: () {
                    // Navigate to the Skeleton Editor Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SkeletonEditorPage()),
                    );
                  },
                  child: const Text('Nuevo\ncaracter', textAlign: TextAlign.center), // Or original text
                ),
                 Expanded(child: Container()), // Added for centering
              ],
            ),
          ),
        ],
      ),
    );
  }
}
