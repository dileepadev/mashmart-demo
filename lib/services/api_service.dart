import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mashmart/models/product_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Data>?> fetchProducts() async {
    var url = Uri.parse('http://10.0.2.2:8000/public-api/products');
    print(url);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      //print(response.body);
      List<Data>? product = Product.fromJson(jsonDecode(response.body)).data;
      print(product);
      return product;
    } else {
      throw Exception("Can't get subjects.");
    }
  }
}
