import 'dart:convert';

import 'package:flutter_application_test/module_18/CRUD/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../model/productModel.dart';

class ProductController {
  List<Data> products = [];

  Future<void> getProducts() async {
    final url = Uri.parse(Urls.readProduct);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(jsonResponse);

      products = model.data ?? [];
    }
  }

  Future<bool> deleteProducts(String productId) async {
    final url = Uri.parse(Urls.deleteProduct(productId));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      getProducts();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createProducts(Data data) async {
    final url = Uri.parse(Urls.createProduct);

    final response = await http.post(
      url,

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice,
      }),
    );

    if (response.statusCode == 200) {
      getProducts();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProducts(String productID, Data data) async {
    final url = Uri.parse(Urls.updateProduct(productID));

    final response = await http.post(
      url,

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice,
      }),
    );

    if (response.statusCode == 200) {
      getProducts();
      return true;
    } else {
      return false;
    }
  }
}
