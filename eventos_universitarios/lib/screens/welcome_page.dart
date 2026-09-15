import 'package:flutter/material.dart';

import '../widgets/campus_logo.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFA31F34);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),

          child: Column(
            children: [
              // Logo de la aplicación
              const Align(alignment: Alignment.centerLeft, child: CampusLogo()),

              const Spacer(),

              // Contenido principal
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TU CAMPUS,\nTUS EVENTOS.',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      height: 1.05,
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Container(width: 60, height: 5, color: red),

                  const SizedBox(height: 22),

                  const Text(
                    'Descubre actividades académicas, deportivas, '
                    'culturales, tecnológicas y talleres dentro de tu universidad.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Botón para entrar a la aplicación
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'EXPLORAR EVENTOS  →',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'CAMPUS EVENTOS · 2026',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
