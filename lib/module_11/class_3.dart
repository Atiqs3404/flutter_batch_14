import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Class3Module11 extends StatefulWidget {
  const Class3Module11({super.key});

  @override
  State<Class3Module11> createState() => _Class3Module11State();
}

class _Class3Module11State extends State<Class3Module11> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Forcefully making the orientation for the application
    // Also this can be used in the main.dart page to force the orientation on full
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(title: Text("Theme Data Class 3")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              orientation == Orientation.portrait
                  ? Text(
                      "Hello now you are in portrait mode",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Hello now you are in landscape mode",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  // Different designs based on orientation (portrait or landscape)
                  child: orientation == Orientation.portrait
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                width: 200,
                                height: 30,
                                "assets/yt_logo.png",
                              ),

                              SizedBox(height: 20),

                              // TextField(
                              //   keyboardType: TextInputType.visiblePassword,
                              //   decoration: InputDecoration(
                              //     hintText: "Enter your password",
                              //     labelText: "Password",
                              //   ),
                              // ),
                              SizedBox(height: 10),

                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Theme Button"),
                              ),

                              SizedBox(height: 20),

                              Container(
                                width: 200.w,
                                height: 150.h,
                                color: Colors.red,
                              ),

                              SizedBox(height: 20),

                              Container(
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.2,
                                color: Colors.blue,
                              ),

                              Text(
                                "Responsive text",
                                style: TextStyle(fontSize: 0.03 * screenWidth),
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                width: 200,
                                height: 30,
                                "assets/yt_logo.png",
                              ),

                              // TextField(
                              //   keyboardType: TextInputType.visiblePassword,
                              //   decoration: InputDecoration(
                              //     hintText: "Enter your password",
                              //     labelText: "Password",
                              //   ),
                              // ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Theme Button"),
                              ),

                              SizedBox(width: 20),

                              Container(
                                width: 200.w,
                                height: 150.h,
                                color: Colors.red,
                              ),

                              SizedBox(width: 20),

                              Container(
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.2,
                                color: Colors.blue,
                              ),

                              SizedBox(width: 20),

                              Text(
                                "Responsive text",
                                style: TextStyle(fontSize: 0.03 * screenWidth),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
