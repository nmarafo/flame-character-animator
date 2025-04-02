import 'dart:typed_data';
import 'package:flutter/material.dart';
// Use image_picker again for device selection
import 'package:image_picker/image_picker.dart'; 
import 'package:http/http.dart' as http;
// import 'dart:async'; // No longer needed for delay

class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  Uint8List? _imageData;
  final ImagePicker _picker = ImagePicker(); // Instantiate ImagePicker
  final TextEditingController _urlController = TextEditingController();

  // Function to pick an image from the device using image_picker
  Future<void> _pickImageFromDevice() async {
    // No artificial delay needed here
    // await Future.delayed(const Duration(milliseconds: 100)); 

    try {
       final XFile? pickedFile = await _picker.pickImage(
         source: ImageSource.gallery, // Specify gallery source
         // Optional: You can request image quality or size constraints here
         // imageQuality: 50,
         // maxWidth: 800,
       );

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        // Check if the widget is still mounted before calling setState
        if (!mounted) return;
        setState(() {
          _imageData = bytes;
        });
      } else {
         if (!mounted) return;
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se seleccionó ninguna imagen.')),
        );
      }
    } catch (e) {
       // Handle potential errors during picking (permissions, etc.)
       if (!mounted) return;
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar la imagen: $e')),
      );
    }
  }

  // Function to fetch an image from a URL (remains the same)
  Future<void> _fetchImageFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
       if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          _imageData = response.bodyBytes;
        });
        _urlController.clear(); // Clear the text field after successful load
      } else {
        // Handle error: Show a snackbar or dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar la imagen: ${response.statusCode}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      // Handle exception: Show a snackbar or dialog
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar la imagen: $e')),
      );
    }
  }

  // Show dialog to choose image source (Device or URL) (remains the same)
  Future<void> _showImageSourceDialog() async {
    // Check mount status before showing dialog
    if (!mounted) return; 
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar fuente de imagen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Desde dispositivo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromDevice(); // Calls the updated function
                },
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Desde URL'),
                onTap: () {
                   Navigator.of(context).pop();
                   _showUrlInputDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Show dialog to input URL (remains the same)
   Future<void> _showUrlInputDialog() async {
     if (!mounted) return;
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) { // Renamed context
        return AlertDialog(
          title: const Text('Ingresar URL de la imagen'),
          content: TextField(
            controller: _urlController,
            decoration: const InputDecoration(hintText: "https://ejemplo.com/imagen.jpg"),
            keyboardType: TextInputType.url,
            onSubmitted: (_) => _submitUrl(dialogContext), // Pass dialogContext
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                _urlController.clear();
                Navigator.of(dialogContext).pop(); // Use dialogContext
              },
            ),
            TextButton(
              child: const Text('Cargar'),
              onPressed: () => _submitUrl(dialogContext), // Pass dialogContext
            ),
          ],
        );
      },
    );
  }

  // Helper function to handle URL submission from dialog
  void _submitUrl(BuildContext dialogContext) {
     final url = _urlController.text.trim();
     // Basic check for empty URL and valid URI format
     if (url.isNotEmpty && Uri.tryParse(url)?.hasAbsolutePath == true) {
        Navigator.of(dialogContext).pop(); // Use dialogContext to pop
        _fetchImageFromUrl(url);
     } else {
        // Check mount status before showing SnackBar
        if (!mounted) return; 
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor ingresa una URL válida')),
        );
     }
  }


  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }


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
              onPressed: _showImageSourceDialog, // Call the dialog function
              child: const Text('Cargar Imagen'),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration( // Add a border for better visibility
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey)
              ),
              alignment: Alignment.center,
              child: _imageData != null
                  ? Image.memory(_imageData!, fit: BoxFit.contain) // Display the loaded image
                  : const Text(
                      'Aquí se mostrará la imagen',
                      // Font should be applied by theme now
                      style: TextStyle(color: Colors.black54), 
                    ), // Placeholder text
            ),
          ),
        ],
      ),
    );
  }
}
