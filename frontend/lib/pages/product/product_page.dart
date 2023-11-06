import 'package:flutter/material.dart';
import 'package:frontend/component/product_widget.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/core/app_textStyles.dart';

class ProductPage extends StatelessWidget {
  final String categoryName;
  final int tableId;
  final int categoryId;

  ProductPage({
    super.key,
    required this.tableId,
    required this.categoryName,
    required this.categoryId,
  });

  Widget _buildBody() {
    return ListView(
      children: [
        ProductWidget(),
        ProductWidget(),
        ProductWidget(),
        ProductWidget(),
        ProductWidget(),
      ],
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
      body: _buildBody(),
    );
  }
}
