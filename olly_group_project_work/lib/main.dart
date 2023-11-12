import 'package:flutter/material.dart';
import 'package:olly_group_project_work/mohammad_work/login.dart';
import 'store_page.dart';
import 'main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Here will first display main menu
      home: const MainMenu(title: 'Barnyard Defenders'),
      routes: {
        '/store' : (context) => StorePage(title: 'Store'),
        '/login' : (context) => LoginPage()
      },
      //home: const StorePage(title: 'Store'),
    );
  }
}
