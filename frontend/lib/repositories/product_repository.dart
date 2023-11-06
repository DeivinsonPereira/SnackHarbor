import 'package:frontend/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final dio = Dio();


  Future<List<ProductModel>> getProductByCategoryId(int id) async {
    try{
      final response = await dio.get('http://10.0.2.2:8080/products/category/$id');
      final list = response.data as List;
      return list.map((e) => ProductModel.fromMap(e)).toList();
  
    } catch(e){
      throw Exception(e);
    }
  }

}