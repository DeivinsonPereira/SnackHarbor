import 'package:flutter/material.dart';
import 'package:frontend/core/app_textStyles.dart';

class ItemsPage extends StatelessWidget {
  final int numeroMesa;
  const ItemsPage({super.key, required this.numeroMesa});

_buildCard(String title, String image) {
    return Stack(children: [
      Container(
        width: 155,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 50,
        left: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 3,
              bottom: 3,
            ),
            child: Center(
              child: Text(title, style: AppTextStyles.buttonTextWhite),
            ),
          ),
        ),
      )
    ]);
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: <Widget>[
          _buildCard('LANCHES', AppImages.categoria_lanches),
          _buildCard('PIZZAS', AppImages.categoria_pizzas),
          _buildCard('SALGADOS', AppImages.categoria_salgados),
          _buildCard('PORÇÕES', AppImages.categoria_porcoes),
          _buildCard('SOBREMESAS', AppImages.categoria_sobremesa),
          _buildCard('BEBIDAS', AppImages.categoria_bebidas),
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Items Page')),
    );
  }
}
