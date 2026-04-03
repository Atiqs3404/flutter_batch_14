import 'package:flutter/material.dart';

class Class4Animation extends StatefulWidget {
  const Class4Animation({super.key});

  @override
  State<Class4Animation> createState() => _Class4AnimationState();
}

class _Class4AnimationState extends State<Class4Animation> {
  bool aniSelected = false;
  bool nonAniSelected = false;
  bool showMessage = false;
  int cartCount = 0;
  bool isLogin = false;
  bool showPanel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Animated Container
            GestureDetector(
              onTap: () {
                setState(() {
                  aniSelected = !aniSelected;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: aniSelected ? 140 : 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: aniSelected ? Colors.green : Colors.grey,
                ),
                alignment: Alignment.center,
                child: Text("Product card"),
              ),
            ),

            SizedBox(height: 20),

            // Normal Container
            GestureDetector(
              onTap: () {
                setState(() {
                  nonAniSelected = !nonAniSelected;
                });
              },
              child: Container(
                height: nonAniSelected ? 140 : 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: nonAniSelected ? Colors.green : Colors.grey,
                ),
                alignment: Alignment.center,
                child: Text("Product card"),
              ),
            ),

            SizedBox(height: 50),
            Divider(),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMessage = !showMessage;
                });

                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    showMessage = false;
                  });
                });
              },
              child: Text("Add to cart"),
            ),

            // Animated Opacity
            AnimatedOpacity(
              opacity: showMessage ? 1 : 0,
              duration: Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.grey.shade100,
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 13,
                    ),
                    child: Text(
                      "Added to cart",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),

            // Animated Switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cart: "),

                AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  child: Text("$cartCount", style: TextStyle(fontSize: 24)),
                  key: ValueKey(cartCount),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      cartCount++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Animated Align
            SizedBox(
              height: 300,
              width: double.infinity,
              child: AnimatedAlign(
                alignment: isLogin
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                duration: Duration(milliseconds: 1000),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text("Login"),
            ),

            SizedBox(height: 30),

            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showPanel = !showPanel;
                        });

                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            showPanel = false;
                          });
                        });
                      },

                      child: Text("Toggle bottom"),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 400),
                    bottom: showPanel ? 0 : -120,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 120,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text("Bottom panel"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
