import 'package:flutter/material.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/repositories/product_repository.dart';

class ProductWidget extends StatelessWidget {
  final repository = ProductRepository();
  final count = ValueNotifier<int>(0);
  final ProductModel productModel;

  ProductWidget({Key? key, required this.productModel}) : super(key: key);

  Widget _buildErrorImage() {
    return const Center(
      child: Text('Image not found!'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildImagemProduto(int categoryId) {
    return FutureBuilder<List<ProductModel>>(
        future: repository.getProductByCategoryId(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: 100,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  productModel.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return _buildErrorImage();
          }
          return _buildLoading();
        });
  }

  Widget _buildCardProduct() {
    return Card(
      elevation: 10,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImagemProduto(productModel.categoryId),
            Column(
              children: [
                Container(
                  width: 150,
                  child: Text(
                    productModel.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: Text(
                    'R\$ ${productModel.price.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _buildActions(),
            SizedBox(
              width: 2,
            )
          ],
        ),
      ),
    );
  }

  Column _buildActions() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            count.value += 1;
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            height: 30,
            width: 30,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        ValueListenableBuilder<int>(
            valueListenable: count,
            builder: (context, value, child) {
              return Text('$value');
            }),
        GestureDetector(
          onTap: () {
            count.value -= 1;
            if (count.value < 0) {
              count.value = 0;
            }
          },
          child: Container(
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            height: 30,
            width: 30,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardProduct();
  }
}
