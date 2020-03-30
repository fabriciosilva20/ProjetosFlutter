import 'package:estado_provider/hero_model.dart';
import 'package:estado_provider/heros_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HerosController herosController = Provider.of<HerosController>(context);

    return ListView.builder(
      itemCount: herosController.heros.length,
      itemBuilder: (ctx, index) {
        return _buildItem(herosController.heros[index]);
      },
    );
  }

  _buildItem(HeroModels model) {
    HerosController herosController = Provider.of<HerosController>(context);

    return ListTile(
      onTap: () {
        herosController.checkFavorito(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        leading: Consumer<HerosController>(
          builder: (ctx, herosController, widget) {
            return Center(
              child: Text(
                "${herosController.heros.where((i) => i.isFavorite).length}",
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        ),
      ),
      body: Consumer<HerosController>(
        builder: (ctx, herosController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
