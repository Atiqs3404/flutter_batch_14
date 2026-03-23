import 'package:flutter/material.dart';

class Class1Module11 extends StatelessWidget {
  const Class1Module11({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Module 11 class 1",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  helperText: "Phone number",
                  labelText: "Phone number",
                  labelStyle: TextStyle(fontSize: 15, color: Colors.deepOrange),
                  hintText: "Enter your phone number",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.check),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  helperText: "Password",
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 15, color: Colors.deepOrange),
                  hintText: "Enter password",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.deepOrange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Simple login system idea

                  // Phone Controller Conditions
                  if (phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter phone number")),
                    );
                  } else if (phoneController.text.length != 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Phone number must be 4 digits")),
                    );
                  } else {
                    phoneController.clear();
                  }

                  // Password Controller Conditions
                  if (passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Enter a password")));
                  } else if (!passwordController.text.contains("@") ||
                      passwordController.text.length != 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Password must contain @ and 6 characters long",
                        ),
                      ),
                    );
                  } else {
                    passwordController.clear();
                  }

                  if (phoneController.text.length == 4 &&
                      (passwordController.text.length == 4 &&
                          passwordController.text.contains("@"))) {
                    print("Login successful");
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Login Successful")));
                  }
                },
                child: Text("Submit"),
              ),

              SizedBox(height: 20),

              Container(
                alignment: Alignment.center,
                height: 70,
                width: 200,
                child: Text("Container Text"),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(4, 10),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(10, 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
