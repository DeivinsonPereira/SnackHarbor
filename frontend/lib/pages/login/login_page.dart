import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/core/app_textStyles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'O nome é obrigatório';
    } else if (value.length > 25) {
      return 'O nome deve ter no máximo 25 caracteres';
    } else if (value.contains(RegExp(r'[0-9]'))) {
      return 'O nome não pode conter números';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/Lanchonete.png'),
                const Text(
                  'Usuário',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.buttonTextWhite,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Digite o nome de usuário aqui',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                    labelStyle: TextStyle(color: AppColors.primary),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    return validateName(value!);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Acessar',
                      style: AppTextStyles.buttonTextOrange,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
