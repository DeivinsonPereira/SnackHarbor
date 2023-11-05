import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/pages/consumption/consumption_page.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/items/category_page.dart';
import 'package:frontend/pages/login/login_page.dart';
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
        '/category': (context) => CategoryPage(),
        '/tablePage': (context) => TablePage(),
        '/consumption': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments;
          if (arguments is int) {
            return ConsumptionPage(tableId: arguments);
          }
          return ErrorPage();
        },
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
