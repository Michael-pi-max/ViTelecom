// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/presentation/screens/add_todo_screen.dart';
// import 'package:flutter_application_1/src/presentation/screens/edit_todo_screen.dart';
// import 'package:flutter_application_1/src/presentation/screens/todo_screen.dart';

// class AppRouter {
//   static const String homeScreen = "/";
//   static const String editTodo = "/edit_todo";
//   static const String addTodo = "/add_todo";

//   Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case "/":
//         return MaterialPageRoute(
//           builder: (_) => TodoScreen(),
//         );
//       case "/edit_todo":
//         return MaterialPageRoute(
//           builder: (_) => EditTodoScreen(),
//         );
//       case "/add_todo":
//         return MaterialPageRoute(
//           builder: (_) => AddTodoScreen(),
//         );
//       default:
//         throw 'Undefined route';
//     }
//   }
// }
