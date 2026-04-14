import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Class1ApiBasics extends StatefulWidget {
  const Class1ApiBasics({super.key});

  @override
  State<Class1ApiBasics> createState() => _Class1ApiBasicsState();
}

class _Class1ApiBasicsState extends State<Class1ApiBasics> {
  List<dynamic> products = [];

  Future<void> getProducts() async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      setState(() {
        products = jsonResponse['products'];
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getProducts();
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
          mainAxisSpacing: 5,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.network(height: 90, products[index]["images"][0]),
                  SizedBox(height: 10),
                  Text(
                    products[index]["title"].toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    products[index]["price"].toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
