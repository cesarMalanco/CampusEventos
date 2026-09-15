import 'package:eventos_universitarios/widgets/campus_logo.dart';
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
  // Guarda lo que se escribe en el buscador
  String busqueda = '';
  // Guarda los títulos de los eventos registrados
  Set<String> eventosRegistrados = <String>{};

  @override
  Widget build(BuildContext context) {
    // === LÓGICA ===
    // Variable que guarda los eventos a mostrar
    // Los eventos (Lista) estan en data/event_data.dart
    var eventosMostrados = eventos;

    // === FILTRO CATEGORÍAS ===
    if (categoriaSeleccionada != 'Todos') {
      // where() recorre la lista de eventos y deja solo aquellos que cumplan
      // la condición que devuelve el return
      // toList() convierte el resultado en una lista
      eventosMostrados = eventos.where((evento) {
        return evento['categoria'] == categoriaSeleccionada;
      }).toList();
    }

    // === BARRA BÚSQUEDA ===
    if (busqueda.isNotEmpty) {
      eventosMostrados = eventosMostrados.where((evento) {
        return evento['titulo'].toString().toLowerCase().contains(
          busqueda.toLowerCase(),
        );
      }).toList();
    }

    // === UI ===
    // Scaffold es la estructura base de una pantalla en Flutter
    return Scaffold(
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
              // Logo de la aplicación
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: const CampusLogo(),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'EVENTOS DEL\nCAMPUS',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  height: 1,
                  letterSpacing: -1,
                ),
              ),

              const SizedBox(height: 14),

              // Línea roja
              Container(width: 55, height: 5, color: const Color(0xFFA31F34)),

              const SizedBox(height: 16),

              const Text(
                'Descubre actividades académicas, deportivas, culturales, '
                'tecnológicas y talleres dentro de tu universidad.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  color: Color(0xFF555555),
                ),
              ),

              const SizedBox(height: 24),

              // UI de la barra de búsqueda
              TextField(
                onChanged: (valor) {
                  setState(() {
                    busqueda = valor;
                  });
                },

                decoration: const InputDecoration(
                  hintText: 'Buscar eventos',

                  prefixIcon: Icon(Icons.search, color: Color(0xFFA31F34)),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Color(0xFFA31F34), width: 2),
                  ),
                ),
              ),

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
                    // Si después de los filtros no hay eventos,
                    // mostramos un mensaje en lugar del GridView
                    if (eventosMostrados.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 60,
                              color: Color(0xFFA31F34),
                            ),

                            SizedBox(height: 16),

                            Text(
                              'No encontramos eventos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Prueba con otra búsqueda o cambia la categoría.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF666666)),
                            ),
                          ],
                        ),
                      );
                    }
                    // Base responsiva sencilla
                    int columnas;
                    if (constraints.maxWidth >= 1200) {
                      // Pantalla muy grande
                      columnas = 4;
                    } else if (constraints.maxWidth >= 850) {
                      // Pantalla grande
                      columnas = 3;
                    } else if (constraints.maxWidth >= 600) {
                      // Tablet o pantalla mediana
                      columnas = 2;
                    } else {
                      // Celular
                      columnas = 1;
                    }

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
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final evento = eventosMostrados[index];

                        final estaRegistrado = eventosRegistrados.contains(
                          evento['titulo'],
                        );

                        // Crea un widget por cada evento
                        return EventCard(
                          evento: evento,
                          registrado: estaRegistrado,

                          onPressed: () {
                            setState(() {
                              if (estaRegistrado) {
                                // Si ya estaba registrado, cancelamos el registro
                                eventosRegistrados.remove(evento['titulo']);
                              } else {
                                // Si no estaba registrado, lo registramos
                                eventosRegistrados.add(evento['titulo']);
                              }
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  estaRegistrado
                                      ? 'Registro cancelado: ${evento['titulo']}'
                                      : 'Te registraste a: ${evento['titulo']}',
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
