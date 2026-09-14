import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> evento;
  final VoidCallback onPressed;

  // Constructor de EventCard
  const EventCard({super.key, required this.evento, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Hace que el contenido respete los bordes de la tarjeta
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // Muestra una imagen tomada de internet
            child: Image.network(
              evento['imagen'],
              // double.infinity = toma todo el ancho que se pueda
              width: double.infinity,
              // Hace que la imagen llene el espacio
              fit: BoxFit.cover,
              // Manejo de error si la imagen no carga
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.image_not_supported, size: 48),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              evento['titulo'],
              maxLines: 2,
              // Evita que el texto se salga si es más largo que la panalla
              overflow: TextOverflow.ellipsis,
              // El estilo titleMedium de theme lo modifica para ponerlo en
              // negritas
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            // 12 izq, 12 der, 0 arriba, 0 abajo
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(evento['categoria']),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Text(evento['fecha']),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('Hora: ${evento['hora']}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text('Lugar: ${evento['lugar']}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('Cupo: ${evento['cupo']}'),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('Registrarme'),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
