import 'package:flutter/material.dart';

class Class1Module12 extends StatelessWidget {
  const Class1Module12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Module 12")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(height: 200, width: 200, color: Colors.green),

                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 180,
                      width: 180,
                      color: Colors.blue,
                    ),
                  ),

                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Stack(
                children: [
                  Image.network(
                    "https://plus.unsplash.com/premium_photo-1673697239981-389164b7b87f?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Container(height: 180, color: Colors.black.withOpacity(0.3)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                          ),
                          child: Text(
                            "BEST DEAL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      // Spacer(), // Use spacer to space between or use mainaxis.spacebetween
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),

              Stack(
                children: [
                  Image.network(
                    "https://plus.unsplash.com/premium_photo-1673697239981-389164b7b87f?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
