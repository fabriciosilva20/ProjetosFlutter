import 'package:estude_agora/Utils/app_routes.dart';
import 'package:estude_agora/models/revisao.dart';
import 'package:flutter/material.dart';

class RevisaoItem extends StatelessWidget {
  final Revisao revisao;

  const RevisaoItem(this.revisao);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text(
            revisao.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SingleChildScrollView(
            child: Text(
              revisao.descricao,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.yellow.withOpacity(0.5),
            Colors.amber,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
