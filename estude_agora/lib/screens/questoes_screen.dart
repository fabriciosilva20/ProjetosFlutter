import 'package:estude_agora/components/main_drawer.dart';
import 'package:flutter/material.dart';

class QuestoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questões'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Text('QUESTÇOES'),
      ),
    );
  }
}
