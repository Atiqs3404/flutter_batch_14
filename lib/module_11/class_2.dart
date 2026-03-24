import 'package:flutter/material.dart';
import 'package:flutter_application_test/home.dart';

class Class2Module11 extends StatelessWidget {
  const Class2Module11({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Images
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/YouTube_Logo_2017.svg/1280px-YouTube_Logo_2017.svg.png",
                    height: 60,
                    width: 250,
                  ),

                  SizedBox(height: 20),

                  Image.asset("assets/yt_logo.png", height: 60, width: 300),

                  SizedBox(height: 20),

                  Text(
                    "Login with phone & password",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(600)),
                  ),

                  SizedBox(height: 20),

                  //Text Form Fields
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      labelStyle: TextStyle(fontSize: 22),
                      hintText: "Enter your phone number",
                      hintStyle: TextStyle(fontSize: 22),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      } else if (value.length != 11) {
                        return "Phone number must be at least 11 digits";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 22),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(fontSize: 22),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6 || !value.contains("@")) {
                        return "Password must contain @ and 6 characters long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Keeps the back button and back page data
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );

                          // Deletes the previous page and removes the back arrow option
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Home()),
                          // );

                          phoneController.clear();
                          passwordController.clear();
                        }
                      },
                      child: Text("Login", style: TextStyle(fontSize: 20)),
                    ),
                  ),

                  Stack(
                    children: [
                      CircleAvatar(radius: 70, backgroundColor: Colors.blue),
                      Positioned(
                        left: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?semt=ais_hybrid&w=740&q=80",
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 15,
                        right: 10,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
