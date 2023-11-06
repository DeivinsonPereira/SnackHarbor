import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/pages/consumption/consumption_page.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/Category/category_page.dart';
import 'package:frontend/pages/login/login_page.dart';
import 'package:frontend/pages/product/product_page.dart';
import 'package:frontend/pages/table/table_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lanchonete',
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/category': (context) => CategoryPage(
              tableId: ModalRoute.of(context)!.settings.arguments as int,
            ),
        '/tablePage': (context) => TablePage(),
        '/product': (context) => ProductPage(
              tableId: ModalRoute.of(context)!.settings.arguments as int,
              categoryName:
                  ModalRoute.of(context)!.settings.arguments as String,
              categoryId: ModalRoute.of(context)!.settings.arguments as int,
            ),
        '/consumption': (context) => ConsumptionPage(
              tableId: ModalRoute.of(context)!.settings.arguments as int,
            ),
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Erro ao carregar a pagina'),
    );
  }
}
