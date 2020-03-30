import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_scree.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'Utils/app_routes.dart';
import 'dados/dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMaels = DUMMY_MEALS;
  List<Meal> _favoriteMaels = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMaels = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMaels.contains(meal)
          ? _favoriteMaels.remove(meal)
          : _favoriteMaels.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMaels.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMaels),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScrenn(_availableMaels),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      // onGenerateRoute: (settings) {//gERA DE ACORDO DE UMA CONDICAO
      //   if (settings.name == '/algumacoisa')
      //     return null;
      //   else
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       },
      //     );
      // },
      // onUnknownRoute: (settings) { //EXECUTA QUANDO A ROTA É DESCONHECIDA
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return CategoriesScreen();
      //     },
      //   );
      // },
    );
  }
}
