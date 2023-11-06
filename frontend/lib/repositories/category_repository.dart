import 'package:http/http.dart' as http;
import 'dart:convert';


Future getCategoryById(int categoryId) async {
  var url = Uri.parse('http://10.0.2.2:8080/categories/$categoryId');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Category not found.');
  }
}

Future<List<dynamic>> getCategories() async {
  var url = Uri.parse('http://10.0.2.2:8080/categories');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Categories not Found.');
  }
}
