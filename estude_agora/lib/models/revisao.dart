import 'package:flutter/material.dart';

class Revisao{
  final String id;
  final String title;
  final String descricao;
  final Color color;

  const Revisao({
    @required this.id,
    @required this.title,
    @required this.descricao,
    this.color = Colors.orange,
  });
}