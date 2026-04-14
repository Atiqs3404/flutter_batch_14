import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_18/CRUD/controller/productController.dart';
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

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchData();
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
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.deepOrange),
                      ),
                      IconButton(
                        onPressed: () {
                          productController
                              .deleteProduct(item.id.toString())
                              .then((value) {
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
    );
  }
}
