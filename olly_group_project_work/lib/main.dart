import 'package:flutter/material.dart';
import 'package:olly_group_project_work/chris_work/cards.dart';
import 'package:olly_group_project_work/chris_work/pathing.dart';
import 'package:olly_group_project_work/mohammad_work/login2.dart';
import 'store_page.dart';
import 'main_menu.dart';
import 'package:olly_group_project_work/omed_work/mainsettings.dart';
import 'package:olly_group_project_work/omed_work/displaystats.dart';

// This function runs the whole app
// Olly implemented navigation (except navigation within mohammads login)

// Stuff in named folders implemented by member whose name it is
// but defender, character, worked on my olly + mohammad

// Changes from proposal - layouts changed to be more mobile device friendly
// added main menu for better navigation
// upgrade + shop screen combined into one screen
// Notifications after each game - this has only implemented one round so after
// this round
// Since we only need dialog or pickers, no pickers, no seasons or night based on those

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
      // Main menu with routes leading to screens
      home: const MainMenu(title: 'Barnyard Defenders'),
      routes: {
        '/store' : (context) => StorePage(title: 'Store'),
        '/login' : (context) => LoginScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/settings': (context) => SettingsPage(),
        '/stats': (context) => StatsScreen(),
        '/game': (context) => MovingDot(),
        '/roundUpgrade': (context) => MyScreen()
      },
    );
  }
}
