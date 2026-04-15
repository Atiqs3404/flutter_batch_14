import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_18/CRUD/controller/productController.dart';
import 'package:flutter_application_test/module_18/CRUD/model/productModel.dart';
import 'package:http/http.dart' as http;

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  ProductController productController = ProductController();

  Future fetchData() async {
    await productController.getProducts();

    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void productDialog(bool isUpdate, {Products? product}) {
    TextEditingController productIdController = TextEditingController();
    TextEditingController productTitleController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();
    TextEditingController productImageController = TextEditingController();

    if (isUpdate) {
      productIdController.text = product!.id.toString();
      productTitleController.text = product.title!;
      productPriceController.text = product.price.toString();
      productImageController.text = product.images!.first;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isUpdate ? "Update product" : "Add product"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productIdController,
              decoration: InputDecoration(labelText: "Id"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: productTitleController,
              decoration: InputDecoration(labelText: "Title"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: productPriceController,
              decoration: InputDecoration(labelText: "price"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: productImageController,
              decoration: InputDecoration(labelText: "Image"),
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (isUpdate) {
                      productController.createProduct(
                        // Products(
                        //   id: int.parse(productIdController.text),
                        //   title: productTitleController.text,
                        //   price: double.parse(productPriceController.text),
                        //   images: [productImageController.text],
                        // ),
                      );
                    } else {
                      productController.updateProduct(
                        // Products(
                        //   id: int.parse(productIdController.text),
                        //   title: productTitleController.text,
                        //   price: double.parse(productPriceController.text),
                        //   images: [productImageController.text],
                        // ),
                      );
                    }
                    await fetchData();
                    Navigator.pop(context);
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Basic", style: TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final item = productController.products[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Image.network(
                    height: 90,
                    item.images != null && item.images!.isNotEmpty
                        ? item.images!.first
                        : "",
                  ),

                  SizedBox(height: 10),

                  Text(
                    item.title.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    item.price.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      IconButton(
                        onPressed: () {
                          productDialog(true, product: item);
                        },
                        icon: Icon(Icons.edit, color: Colors.deepOrange),
                      ),
                      IconButton(
                        onPressed: () {
                          productController
                              .deleteProduct(item.id.toString())
                              .then((value) async {
                                await fetchData();
                                if (value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Product deleted")),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Something wrong")),
                                  );
                                }
                              });
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productDialog(false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
