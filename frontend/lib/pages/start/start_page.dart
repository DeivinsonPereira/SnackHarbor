import 'package:flutter/material.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/pages/home/home_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        title: const Text(
          'Start Page',
          style: AppTextStyles.buttonTextOrange,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              padding: const EdgeInsets.all(20),
              height: 450,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: Column(
                    children: [
                      const Text(
                        'Table or Commands',
                        style: AppTextStyles.gray,
                      ),
                      TextFormField(),
                      Container(
                        padding: EdgeInsets.only(top: 120),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(texto: 'Inserir Item'),
                            CustomButton(texto: 'Ver Detalhes')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
    );
  }
}
