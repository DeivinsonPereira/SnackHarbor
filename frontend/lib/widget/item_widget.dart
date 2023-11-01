import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

enum StatusMesa { ocupada, livre, fechamento }

Color statusToColor(StatusMesa value) {
  Color cor = AppColors.statusMesaLivre;
  switch (value) {
    case StatusMesa.livre:
      break;
    case StatusMesa.ocupada:
      cor = AppColors.statusMesaOcupada;
      break;
    case StatusMesa.fechamento:
      cor = AppColors.statusMesaFechamento;
      break;
  }
  return cor;
}
