import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_12/class_1_grid_view.dart';
import 'package:flutter_application_test/module_13/class_2_alert_types.dart';
import 'package:flutter_application_test/module_13/widget/city_card.dart';
import 'package:flutter_application_test/module_14/class_2_navigation.dart';

class Class3Module14 extends StatefulWidget {
  const Class3Module14({super.key});

  @override
  State<Class3Module14> createState() => _Class3Module14State();
}

class _Class3Module14State extends State<Class3Module14> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              color: Colors.greenAccent,
              child: TabBar(
                // When there is too many tabs
                // isScrollable: true,
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: -15),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.favorite), text: "Favorite"),
                  Tab(icon: Icon(Icons.settings), text: "Settings"),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            // // Refers to first tab
            // Container(
            //   decoration: BoxDecoration(color: Colors.deepOrange),
            //   child: Center(
            //     child: Text(
            //       "Home",
            //       style: TextStyle(fontSize: 30, color: Colors.white),
            //     ),
            //   ),
            // ),

            // // Refers to second tab
            // Container(
            //   decoration: BoxDecoration(color: Colors.deepPurple),
            //   child: Center(
            //     child: Text(
            //       "Favorite",
            //       style: TextStyle(fontSize: 30, color: Colors.white),
            //     ),
            //   ),
            // ),

            // // Refers to third tab
            // Container(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Center(
            //     child: Text(
            //       "Settings",
            //       style: TextStyle(fontSize: 30, color: Colors.white),
            //     ),
            //   ),
            // ),

            // 1st tab
            CityCard(
              img:
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              CityName: 'Chittagong',
              rating: '4.0',
            ),

            // 2nd tab
            Class2AlertDialog(),

            // 3rd tab
            Column(
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                Text("Custom UI"),
              ],
            ),
          ],
        ),

        // endDrawer: Drawer( will move the drawer to the right end
        drawer: Drawer(
          child: ListView(
            children: [
              // Drawer header
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                      ),
                    ),
                    Text(
                      "Atiq Hasan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "atiqs7540@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Drawer body / item
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("List item-1"),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
