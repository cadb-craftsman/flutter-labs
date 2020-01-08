import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cardview_list_rest_app/cardviewlist/Product.dart';

class NetworkServices {
  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get('http://127.0.0.1:3000/products');
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
