import 'package:flutter/material.dart';
import 'package:frontend/core/app_requisition.dart';
import 'package:frontend/widget/category_widget.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: getTables(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error: Unable to load the tables.'),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final statusString = snapshot.data![index]['status'];
                    final statusEnum = statusStringToEnum(statusString);
                    var valor = snapshot.data![index]['total'];
                    
                    if (valor == 0) {
                      valor = 0.0;
                    } else if (valor is int) {
                      valor = valor.toDouble();
                    }
                    return ItemWidget(
                      status: statusEnum,
                      index: index,
                      valor: valor,
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )),
      ),
    );
  }
}
