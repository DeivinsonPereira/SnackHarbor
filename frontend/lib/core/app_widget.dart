import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/pages/consumption/consumption_page.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/items/items_Page.dart';
import 'package:frontend/pages/login/login_page.dart';

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
        '/items': (context) => ItemsPage(),
        '/consumption': (context) => ConsumptionPage(),
      },
    );
  }
}
