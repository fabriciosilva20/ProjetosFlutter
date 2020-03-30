import 'package:flutter/material.dart';

//Para gerar o tamplate da classe basta digitar st

class Resposta extends StatelessWidget {
  final String textoResposta;
  final void Function() onSelecao;

  Resposta(this.textoResposta, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.textoResposta),
        onPressed: onSelecao,
      ),
    );
  }
}
