import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/pages/consumption/consumption_page.dart';

StatusMesa statusStringToEnum(String statusString) {
  statusString = statusString[0].toUpperCase() + statusString.substring(1);
  final statusEnum = EnumToString.fromString(StatusMesa.values, statusString);
  return statusEnum ?? StatusMesa.FREE;
}

// ignore: constant_identifier_names
enum StatusMesa { OCCUPIED, FREE, CLOSING }

Color statusToColor(String statusTable) {
  switch (statusTable.toLowerCase()) {
    case "free":
      return AppColors.statusMesaLivre;
    case "occupied":
      return AppColors.statusMesaOcupada;
    case "closing":
      return AppColors.statusMesaFechamento;
    default:
      return AppColors.statusMesaLivre;
  }
}

String statusToString(StatusMesa value) {
  switch (value) {
    case StatusMesa.FREE:
      return 'Livre';
    case StatusMesa.OCCUPIED:
      return 'Ocupada';
    case StatusMesa.CLOSING:
      return 'Fechamento';
  }
}

class ItemWidget extends StatelessWidget {
  final StatusMesa status;
  final int index;
  final double valor;
  ItemWidget({
    super.key,
    required this.status,
    required this.index,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (status == StatusMesa.FREE) {
          Navigator.of(context).pushNamed('/category', arguments: index);
        } else {
          final mesaId = index;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ConsumptionPage(tableId: mesaId + 1),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: statusToColor(EnumToString.convertToString(status)),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                color: Colors.black,
                blurRadius: 4.0,
              ),
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            statusToString(status),
            style: AppTextStyles.statusMesa,
          ),
          Text(
            '${(index + 1).toString().padLeft(2, '0')}',
            style: AppTextStyles.numeroMesa,
          ),
          if (valor != 0.0)
            Text(
              '${valor.toStringAsFixed(2)}',
              style: AppTextStyles.valorMesa,
            ),
        ]),
      ),
    );
  }
}
