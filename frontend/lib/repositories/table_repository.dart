import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addOrderToTable(int tableId, int productId) async {
  final String apiUrl = "http://sua-api.com/api/$tableId/add-order/$productId";
  final response = await http.post(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
  } else {
    throw Exception('Falha ao adicionar o pedido à mesa $tableId');
  }
}

Future clearItemsConsumed(int tableId) async{
  var url = Uri.parse('http://10.0.2.2:8080/tables/$tableId/orders');
  var response = await http.delete(url);
  if (response.statusCode == 204) {
  } else {
    print('Erro ao excluir itens consumidos. Código de status: ${response.statusCode}');
  }
}

Future updateStatus(int tableId, String newStatus) async {
  var url = Uri.parse('http://10.0.2.2:8080/tables/$tableId/status');

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({"status": newStatus});
  var response = await http.patch(url, headers: headers, body: body);
  if (response.statusCode == 200) {
  } else {
    throw Exception('Status not Found.');
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

Future getTablesById(int tableId) async {
  var url = Uri.parse('http://10.0.2.2:8080/tables/$tableId/total');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Table not found.');
  }
}