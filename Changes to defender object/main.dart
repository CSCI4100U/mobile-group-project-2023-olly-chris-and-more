import 'package:final_barnyard_defenders/barnyard_defenders_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:final_barnyard_defenders/chris_work/cards.dart';
import 'package:final_barnyard_defenders/chris_work/pathing.dart';
import 'package:final_barnyard_defenders/mohammad_work/login2.dart';
import 'store_page.dart';
import 'main_menu.dart';
import 'package:final_barnyard_defenders/omed_work/mainsettings.dart';
import 'package:final_barnyard_defenders/omed_work/displaystats.dart';
import 'game_page.dart';

// This function runs the whole app
// Olly implemented navigation (except navigation within mohammads login)

// Stuff in named folders implemented by member whose name it is
// but defender, character, worked on by olly + mohammad

// Changes from proposal - layouts changed to be more mobile device friendly
// added main menu for better navigation
// upgrade + shop screen combined into one screen
// Notifications after each game - this has only implemented one round so after
// this round
// Since we only need dialog or pickers, no pickers, no seasons or night based on those

// Goals - Want to watch the video and work through the spawnpoints
// then get all the characters that will be used
// then add label to store telling user they may pick 3 characters and an upgrade
// then set it up so user can add 3 characters to a list which gets sent to the game
// might need to look at change notifier stuff for that part

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  // Why am i getting camera error
  //runApp(GameWidget(game: game));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Game is created - need to add defenders to it, pass it into store to do that
  BarnyardDefendersGame? _game;

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
        '/store' : (context) => StorePage(title: 'Store', game: _game!),
        '/login' : (context) => LoginScreen(),
        '/createAccount': (context) => CreateAccountScreen(),
        '/settings': (context) => SettingsPage(),
        '/stats': (context) => StatsScreen(),
        //'/game': (context) => MovingDot(),
        // Change this so it passes in same game
        '/game': (context) => GamePage(game: _game!),
        '/roundUpgrade': (context) => MyScreen()
      },
    );
  }
}
