import 'package:flutter/material.dart';

import 'package:flutter_application_1/src/widgets/bottom_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ViTelecome',
      theme: ThemeData(
        primaryColor: Color(0xFF0175D8),
      ),
      home: Sidebar(),
    );
  }
}
