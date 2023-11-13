import 'package:flutter/material.dart';
import 'package:olly_group_project_work/chris_work/pathing.dart';
import 'package:olly_group_project_work/mohammad_work/login.dart';
import 'package:olly_group_project_work/mohammad_work/login2.dart';
import 'store_page.dart';
import 'main_menu.dart';
import 'package:olly_group_project_work/omed_work/mainsettings.dart';
import 'package:olly_group_project_work/omed_work/displaystats.dart';


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
        '/login' : (context) => LoginScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/settings': (context) => SettingsPage(),
        '/stats': (context) => StatsScreen(),
        '/game': (context) => MovingDot()
      },
      //home: const StorePage(title: 'Store'),
    );
  }
}
