// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Styles {

  Styles();

  final TextStyle _titulo = const TextStyle(
    fontSize: 24.0,
  );

  final TextStyle _subtitulo = const TextStyle(
    fontSize: 13.0,
  );
  
  get titulo => _titulo;
  get subtitulo => _subtitulo;
}
