import 'package:flutter/material.dart';

Widget tituloTarefa() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Lista de Tarefas',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}