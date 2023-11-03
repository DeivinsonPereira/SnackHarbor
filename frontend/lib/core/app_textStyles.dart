import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class AppTextStyles {
  static const TextStyle buttonTextOrange = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  static const TextStyle buttonTextWhite = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle gray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 221, 221, 221),);

  static const TextStyle statusMesa = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );    

  static const TextStyle numeroMesa = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle valorMesa = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
