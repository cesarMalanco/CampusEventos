// Importa los widgets visuales (Scaffold, Text, Column, etc.)
import 'package:flutter/material.dart';

// Importa la WelcomePage
import 'screens/welcome_page.dart';

// Importa el theme
import 'theme/app_theme.dart';

void main() {
  // Inicia la aplicación usando CampusEventosApp como widget principal
  runApp(const CampusEventosApp());
}

// El widget CampusEventosApp es StatelessWidget porque no necesita guardar
// algun estado que cambie
class CampusEventosApp extends StatelessWidget {
  // Key es un "id" interno para identificar widgets
  const CampusEventosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Elimina la etiqueta "DEBUG" de la UI
      debugShowCheckedModeBanner: false,
      title: 'Campus Eventos',
      theme: AppTheme.lightTheme,
      // Indica que la primera pantalla a mostrar es WelcomePage
      home: const WelcomePage(),
    );
  }
}
