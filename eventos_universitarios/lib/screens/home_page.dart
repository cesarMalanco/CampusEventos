import 'package:flutter/material.dart';

import '../data/event_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/event_card.dart';

// HomePage hereda StatefulWidget porque esta pantalla va a cambiar
// al usarla
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Bandera que indica la categoría seleccionada
  String categoriaSeleccionada = 'Todos';

  @override
  Widget build(BuildContext context) {
    // === LÓGICA ===
    // Variable que guarda los eventos a mostrar
    // Los eventos (Lista) estan en data/event_data.dart
    var eventosMostrados = eventos;

    if (categoriaSeleccionada != 'Todos') {
      // where() recorre la lista de eventos y deja solo aquellos que cumplan
      // la condición que devuelve el return
      // toList() convierte el resultado en una lista
      eventosMostrados = eventos.where((evento) {
        return evento['categoria'] == categoriaSeleccionada;
      }).toList();
    }

    // === UI ===
    // Scaffold es la estructura base de una pantalla en Flutter
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Eventos')),
      // body es el contenido principal de la pantalla
      // SafeArea evita que el contenido se adapte bien al dispositivo.
      // Evita que quede debajo de zonas especiales de la pantalla
      body: SafeArea(
        // Padding agrega espacio alrededor del contenido
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eventos universitarios',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              // SizedBox (caja) para dejar espacio entre elementos
              const SizedBox(height: 6),
              const Text(
                'Descubre actividades académicas, culturales y deportivas.',
              ),
              const SizedBox(height: 20),

              // SizedBox crea una caja
              SizedBox(
                height: 42,
                // ListView crea listas que pueden desplazarse
                child: ListView.builder(
                  // Mueve la lista horizontalmente (la de categorías)
                  scrollDirection: Axis.horizontal,
                  // Cuenta el número de categorías y ListView crea 6 elementos
                  itemCount: categorias.length,
                  // Función para construir cada elemento (empieza en index = 0)
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];

                    // Crea el widget CategoryChip de cada uno de los elementos
                    return CategoryChip(
                      texto: categoria,
                      // Muestra si esa categoría está seleccionada
                      seleccionado: categoriaSeleccionada == categoria,
                      // Acción definida para cuando el usuario presione esa
                      // categoría
                      onTap: () {
                        // setState() vuelve a construir la pantalla para
                        // actualizarla con el cambio realizado
                        setState(() {
                          categoriaSeleccionada = categoria;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Eventos encontrados: ${eventosMostrados.length}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              // Expanded = Usa todo el espacio restante dispoible
              Expanded(
                // LayoutBuilder permite saber cúanto espacio hay disponible en
                // la app
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Base responsiva sencilla
                    // Pantalla grande -> 4 columnas
                    final columnas = constraints.maxWidth >= 900
                        ? 4
                        : constraints.maxWidth >= 600
                        // Pantalla mediana -> 3 columnas
                        ? 3
                        // Pantalla chica -> 2 columnas
                        : 2;
                    // ==
                    /*int columnas;
                      if (constraints.maxWidth >= 900) {
                        columnas = 4;
                      } else if (constraints.maxWidth >= 600) {
                        columnas = 3;
                      } else {
                        columnas = 2;
                      }
                    */

                    // GridView crea una cuadrícula
                    return GridView.builder(
                      // itemCount crea tantas tarjetas como eventos haya
                      // después del filtro
                      itemCount: eventosMostrados.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnas,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        // Controla la proporción entre ancho y alto de las
                        // tarjetas (entre menos el número más alta)
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final evento = eventosMostrados[index];

                        // Crea un widget por cada evento
                        return EventCard(
                          evento: evento,
                          onPressed: () {
                            // Muestra un SnackBar (mensaje temporal)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Evento "${evento['titulo']}" seleccionado',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
