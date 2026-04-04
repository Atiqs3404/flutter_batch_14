import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_12/class_2_list_view_expanded.dart';
import 'package:flutter_application_test/module_13/class_1_custom_widget_usage.dart';
import 'package:flutter_application_test/module_13/class_3_drag_drop.dart';
import 'package:flutter_application_test/module_13/class_4_animation.dart';
import 'package:flutter_application_test/module_14/class_2_navigation.dart';

class Class1BottomNav extends StatefulWidget {
  const Class1BottomNav({super.key});

  @override
  State<Class1BottomNav> createState() => _Class1BottomNavState();
}

class _Class1BottomNavState extends State<Class1BottomNav> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    Class2ListViewExpanded(),
    DragDrop(),
    Class4Animation(),
    Class2Navigation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },

        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.message), label: "Inbox"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
