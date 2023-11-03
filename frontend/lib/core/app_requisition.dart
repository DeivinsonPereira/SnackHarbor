import 'dart:convert';
import 'package:http/http.dart' as http;

Future getTablesById(int tableId) async {
  var url = Uri.parse('http://10.0.2.2:8080/tables/$tableId/total');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Table not found.');
  }
}

Future<List<dynamic>> getTables() async {
  var url = Uri.parse('http://10.0.2.2:8080/tables');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Tables not Found.');
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
