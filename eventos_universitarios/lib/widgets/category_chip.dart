import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String texto;
  final bool seleccionado;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.texto,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFA31F34);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(texto),
        selected: seleccionado,
        onSelected: (_) => onTap(),
        selectedColor: red,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: seleccionado ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 0.8,
        ),
        side: BorderSide(color: seleccionado ? red : const Color(0xFFD0D0D0)),
        showCheckmark: false,
      ),
    );
  }
}
