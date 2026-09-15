import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> evento;
  final VoidCallback onPressed;
  final bool registrado;

  // Constructor de EventCard
  const EventCard({
    super.key,
    required this.evento,
    required this.onPressed,
    required this.registrado,
  });

  // Devuelve un icono diferente dependiendo de la categoría
  IconData obtenerIconoCategoria(String categoria) {
    if (categoria == 'Académicos') {
      return Icons.school_outlined;
    } else if (categoria == 'Deportivos') {
      return Icons.sports_soccer;
    } else if (categoria == 'Culturales') {
      return Icons.palette_outlined;
    } else if (categoria == 'Tecnología') {
      return Icons.computer;
    } else if (categoria == 'Talleres') {
      return Icons.handyman_outlined;
    } else {
      return Icons.event_outlined;
    }
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(
                  obtenerIconoCategoria(evento['categoria']),
                  size: 18,
                  color: const Color(0xFFA31F34),
                ),
                const SizedBox(width: 6),
                Text(
                  evento['categoria'].toString().toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFFA31F34),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
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

          if (registrado)
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: Text(
                'Registrado',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA31F34),
                  foregroundColor: Colors.white,
                ),
                child: Text(registrado ? 'Cancelar registro' : 'Registrarme'),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
