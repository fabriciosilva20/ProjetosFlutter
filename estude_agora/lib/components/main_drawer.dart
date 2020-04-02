import 'package:flutter/material.dart';
import '../Utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _avatar() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Text('FM'),
          ),
          Container(
            height: 12.0,
          ),
          Text(
            "Fabrício Moireira",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text("fabricio@moreiraweb.com"),
        ],
      ),
    );
  }

  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  _avatar(),
                  _createItem(
                    Icons.home,
                    'Home',
                    () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.HOME),
                  ),
                  _createItem(
                    Icons.view_list,
                    'Questões',
                    () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.QUESTOES),
                  ),
                  _createItem(
                    Icons.add_to_home_screen,
                    'Enviar Questão',
                    () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.HOME),
                  ),
                  _createItem(
                    Icons.settings,
                    'Configurações',
                    () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.SETTINGS),
                  ),
                  Divider(color: Colors.black),
                  _createItem(
                    Icons.exit_to_app,
                    'Sair',
                    () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.LOGIN),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'www.moreiraweb.com.br',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
