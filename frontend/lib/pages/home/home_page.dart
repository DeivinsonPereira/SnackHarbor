import 'package:flutter/material.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/pages/config/config_page.dart';
import 'package:frontend/pages/items/items_Page.dart';
import 'package:frontend/pages/start/start_page.dart';
import 'package:frontend/pages/table/table_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final _paginas = <Widget>[
    StartPage(),
    TablePage(),
    ItemsPage(),
    ConfigPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          _index = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_sharp),
            label: 'Mesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Itens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String texto;

  const CustomButton({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      width: 110,
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          texto,
          style: AppTextStyles.buttonTextOrange,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
