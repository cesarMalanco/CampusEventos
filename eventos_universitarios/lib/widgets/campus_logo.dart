import 'package:flutter/material.dart';

class CampusLogo extends StatelessWidget {
  const CampusLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFA31F34);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Símbolo geométrico del logo
        Column(
          children: [
            Row(
              children: [
                Container(width: 10, height: 28, color: red),
                const SizedBox(width: 4),
                Container(width: 10, height: 18, color: red),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(width: 10, height: 18, color: red),
                const SizedBox(width: 4),
                Container(width: 10, height: 28, color: red),
              ],
            ),
          ],
        ),

        const SizedBox(width: 12),

        // Nombre de la aplicación
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CAMPUS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            Text(
              'EVENTOS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                color: red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
