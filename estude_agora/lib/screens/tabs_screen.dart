import 'package:estude_agora/components/main_drawer.dart';
import 'package:estude_agora/screens/dicas_screen.dart';
import 'package:estude_agora/screens/revisoes_screen.dart';
import 'package:flutter/material.dart';

import 'estatisticas_screen.dart';


class TabsScreen extends StatefulWidget {
  


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Estatísticas',
        'screen': EstatisticasScreen(), 
      },
      {
        'title': 'Dicas',
        'screen': DicasScreen(), 
      },
      {
        'title': 'Revisões',
        'screen': RevisoesScreen(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.pie_chart),
            title: Text('Estatísticas'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.visibility),
            title: Text('Dicas'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.rate_review),
            title: Text('Revisões'),
          )
        ],
      ),
    );
  }
}
