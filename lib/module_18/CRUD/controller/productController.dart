// All methods
import 'dart:convert';

import 'package:flutter_application_test/module_18/CRUD/model/productModel.dart';
import 'package:flutter_application_test/module_18/CRUD/utils/utils.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Products> products = [];

  Future<void> getProducts() async {
    final url = Uri.parse(Urls.readProduct);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      ProductModel model = ProductModel.fromJson(jsonResponse);

      products = model.products ?? [];

      print("products length: ${products.length}");
    }
  }

  Future<bool> deleteProduct(String productId) async {
    final url = Uri.parse(Urls.deleteProduct(productId));

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      getProducts();
      return true;
    } else {
      return false;
    }
  }
}
