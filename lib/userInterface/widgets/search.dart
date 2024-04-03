import 'package:flutter/material.dart';

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0), 
          prefixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            child: const Icon(Icons.search, color: Colors.black, size: 24), 
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 32,
            minWidth: 48, 
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            borderSide: BorderSide.none, 
          ),
          hintText: 'Buscar',
          hintStyle: const TextStyle(color: Colors.blueGrey),
        ),
      ),
    ),
  );
}