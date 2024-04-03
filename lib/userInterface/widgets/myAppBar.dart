import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppBar extends AppBar {
  String texto;
  MyAppBar({required this.texto}) : super(title: Text(texto));
}
