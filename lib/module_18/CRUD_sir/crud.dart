import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_18/CRUD/controller/productController.dart';
import 'package:flutter_application_test/module_18/CRUD_sir/model/productModel.dart';
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

    if (mounted) {
      setState(() {});
    }
  }

  productDialog(bool isUpdate, {Data? data}) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    if (isUpdate) {
      productNameController.text = data!.productName.toString();
      productIMGController.text = data.img.toString();
      productQTYController.text = data.qty.toString();
      productUnitPriceController.text = data.unitPrice.toString();
      productUnitPriceController.text = data.totalPrice.toString();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isUpdate ? 'Update Product' : 'Add product'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),

              TextField(
                controller: productIMGController,

                decoration: InputDecoration(labelText: 'Image'),
              ),
              SizedBox(height: 10),

              TextField(
                controller: productQTYController,
                decoration: InputDecoration(labelText: 'QTY'),
              ),
              SizedBox(height: 10),

              TextField(
                controller: productUnitPriceController,
                decoration: InputDecoration(labelText: 'Unit price'),
              ),
              SizedBox(height: 10),

              TextField(
                controller: productTotalPriceController,
                decoration: InputDecoration(labelText: 'Total price'),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancle'),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (isUpdate) {
                        productController.updateProducts(
                          data!.sId.toString(),
                          Data(
                            productName: productNameController.text,
                            img: productIMGController.text,
                            qty: int.parse(productQTYController.text),
                            unitPrice: int.parse(
                              productUnitPriceController.text,
                            ),
                            totalPrice: int.parse(
                              productTotalPriceController.text,
                            ),
                          ),
                        );
                      } else {
                        productController.createProducts(
                          Data(
                            productName: productNameController.text,
                            img: productIMGController.text,
                            qty: int.parse(productQTYController.text),
                            unitPrice: int.parse(
                              productUnitPriceController.text,
                            ),
                            totalPrice: int.parse(
                              productTotalPriceController.text,
                            ),
                          ),
                        );
                      }

                      await fetchData();
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.78,
        ),
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final item = productController.products[index];
          return Card(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: Image.network(item.img.toString()),
                  ),
                  Text(
                    item.productName.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('Price : ${item.unitPrice}'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      IconButton(
                        onPressed: () {
                          productDialog(true, data: item);
                        },
                        icon: Icon(Icons.edit, color: Colors.orange),
                      ),
                      IconButton(
                        onPressed: () {
                          productController
                              .deleteProducts(item.sId.toString())
                              .then((value) async {
                                await fetchData();
                                if (value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Product deleted')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Something wrong...!'),
                                    ),
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
