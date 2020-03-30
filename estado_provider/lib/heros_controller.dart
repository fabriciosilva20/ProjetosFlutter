import 'package:estado_provider/hero_model.dart';
import 'package:flutter/cupertino.dart';

class HerosController extends ChangeNotifier{
  List<HeroModels> heros = [
    HeroModels(name: 'Thor'),
    HeroModels(name: 'Iron Man'),
    HeroModels(name: 'Batman'),
    HeroModels(name: 'captan America'),
    HeroModels(name: 'Super Man'),
  
  ];

  checkFavorito(HeroModels models){
    models.isFavorite = !models.isFavorite;
    notifyListeners();
  }
}