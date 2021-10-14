import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/screens/todo_screen.dart';
import 'package:flutter_application_1/src/screens/LandingScreen.dart';
import 'package:flutter_application_1/src/screens/completion_page.dart';
import 'package:flutter_application_1/src/screens/job_started.dart';
import 'package:flutter_application_1/src/screens/front_page.dart';
import 'package:flutter_application_1/src/screens/profile.dart';
import 'package:flutter_application_1/src/screens/work_order.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int currentIndex = 0;

  final screens = [
    LandingScreen(),
    WorkOrderScreen(),
    FrontPage(),
    FourthPage(),
    CompletePage(),
    // ProfileScreen(),
  ];

  final selectedColor = Colors.white;
  final unSelectedColor = Colors.white60;
  final labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFF0175D8),
        selectedItemColor: selectedColor,
        unselectedItemColor: unSelectedColor,
        unselectedFontSize: 0.0,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.first_page),
            label: 'Front',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate),
            label: 'Start',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
