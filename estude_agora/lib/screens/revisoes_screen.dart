import 'package:estude_agora/components/form_nova_categoria_revisao.dart';
import 'package:estude_agora/components/revisao_item.dart';
import 'package:estude_agora/data/dummy_data.dart';
import 'package:flutter/material.dart';

class RevisoesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_REVISOES.map((rev) {
          return RevisaoItem(rev);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NovaCategoriaRevisao.formModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
