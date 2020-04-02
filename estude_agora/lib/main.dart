import 'package:estude_agora/Utils/app_routes.dart';
import 'package:estude_agora/screens/codigo_transito_screen.dart';
import 'package:estude_agora/screens/login_screen.dart';
import 'package:estude_agora/screens/novo_cadastro_screen.dart';
import 'package:estude_agora/screens/questoes_screen.dart';
import 'package:estude_agora/screens/settings_screen.dart';
import 'package:estude_agora/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faça Certo!',
      theme: ThemeData(
        primaryColor:  Color(0xFFf45d27),
        accentColor: Colors.amber[500],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        primarySwatch: Colors.red,
      ),
      routes: {
        AppRoutes.LOGIN: (ctx) => LoginScreen(),
        AppRoutes.NOVO_CADASTRO: (ctx) => NovoCadastroScreen(),
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
        AppRoutes.QUESTOES: (ctx) => QuestoesScreen(),
      },
      // home: Scaffold(
      //   appBar: null,
      //   body: LoginWidget(),
      // ),
    );
  }
}
