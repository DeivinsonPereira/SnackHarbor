import 'package:flutter/material.dart';
import 'package:frontend/component/product_widget.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/core/app_textStyles.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/repositories/product_repository.dart';

class ProductPage extends StatelessWidget {
  final String categoryName;
  final int tableId;
  final int categoryId;
  final repository = ProductRepository();

  ProductPage({
    super.key,
    required this.tableId,
    required this.categoryName,
    required this.categoryId,
  });

  Widget _buildBody(List<ProductModel> productslist) {
    return ListView(
      children: productslist
          .map(
            (model) => ProductWidget(
              productModel: model,
            ),
          )
          .toList(),
    );
  }

  Widget _buildError() {
    return const Text(
      'Error: products not found!',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            this.categoryName +
                '| Mesa ' +
                this.tableId.toString().padLeft(2, '0'),
            style: AppTextStyles.buttonTextOrange,
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          iconTheme: const IconThemeData(color: AppColors.secondary)),
      body: FutureBuilder<List<ProductModel>>(
        future: repository.getProductByCategoryId(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return _buildBody(snapshot.data!);
          }
          if (snapshot.hasError) {
            return _buildError();
          }
          return _buildLoading();
        },
      ),
    );
  }
}
