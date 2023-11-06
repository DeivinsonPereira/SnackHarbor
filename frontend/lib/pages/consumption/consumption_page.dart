import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/pages/Category/category_page.dart';
import 'package:frontend/repositories/table_repository.dart';

class ConsumptionPage extends StatelessWidget {
  final int tableId;

  const ConsumptionPage({Key? key, required this.tableId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Container(
          child: const Text(
            'Consumo',
            style: AppTextStyles.buttonTextOrange,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getTablesById(tableId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error: consumption not found');
          }
          if (snapshot.hasData) {
            final itemsConsumed = snapshot.data!['orders'] as List<dynamic>;
            final filteredItems = itemsConsumed.where((item) {
              return item['status'] != "FREE" && item['tableId'] == tableId;
            }).toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: itemsConsumed.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text(
                          item['product']['name'],
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.45),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          'R\$${item['product']['price'].toStringAsFixed(2)}',
                          style: AppTextStyles.buttonTextOrange,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.45),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$${snapshot.data!['total'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.secondary,
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (snapshot.data!['status'] == "OCCUPIED") ...[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.secondary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CategoryPage(tableId: tableId,);
                              }),
                            );
                          },
                          child: const Text(
                            'Inserir Novo Produto',
                            style: AppTextStyles.buttonTextWhite,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.secondary),
                          ),
                          onPressed: () async {
                            if (snapshot.data!['status'] == "OCCUPIED") {
                              await updateStatus(tableId, "CLOSING");
                              Navigator.of(context)
                                  .pushReplacementNamed('/tablePage');
                            }
                          },
                          child: const Text(
                            'Encerrar',
                            style: AppTextStyles.buttonTextWhite,
                          ),
                        ),
                      ],
                      if (snapshot.data!['status'] == "CLOSING") ...[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.secondary),
                          ),
                          onPressed: () async {
                            if (snapshot.data!['status'] == "CLOSING") {
                              try {
                                await updateStatus(tableId, "FREE");
                                clearItemsConsumed(tableId);
                                Navigator.of(context)
                                    .pushReplacementNamed('/tablePage');
                              } catch (error) {
                                print('Erro: $error');
                              }
                            }
                          },
                          child: const Text(
                            'Limpar Mesa',
                            style: AppTextStyles.buttonTextWhite,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
