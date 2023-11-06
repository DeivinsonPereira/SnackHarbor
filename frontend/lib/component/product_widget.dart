import 'package:flutter/material.dart';
import 'package:frontend/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final count = ValueNotifier<int>(0);
  final ProductModel productModel;

  ProductWidget({Key? key, required this.productModel}) : super(key: key);

  Widget _buildCardProduct() {
    return Card(
      elevation: 10,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FlutterLogo(
              size: 100,
            ),
            Column(
              children: [
                Text(
                  productModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'R\$ ${productModel.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
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
