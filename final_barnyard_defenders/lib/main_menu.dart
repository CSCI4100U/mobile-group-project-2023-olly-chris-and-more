import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key, required this.title});

  final String title;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with TickerProviderStateMixin {
  late AnimationController _bgColorController;
  late Animation<Color?> _bgColorAnimation;

  double opacityLevel = 0.0;
  double translateY = 50.0;

  @override
  void initState() {
    super.initState();
    _initializeBackgroundAnimation();
    _startBackgroundAnimation();

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0;
        translateY = 0.0;
      });
    });
  }

  void _initializeBackgroundAnimation() {
    _bgColorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8), 
    );

    _bgColorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.red[900], end: Colors.brown),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.brown, end: Colors.red[900]),
          weight: 1,
        ),
      ],
    ).animate(_bgColorController);
  }

  void _startBackgroundAnimation() {
    _bgColorController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final comfortaaFont = FontLoader('Comfortaa');
    comfortaaFont.addFont(rootBundle.load('assets/fonts/Comfortaa-Regular.ttf'));

    return Scaffold(
      body: AnimatedBuilder(
        animation: _bgColorAnimation,
        builder: (context, child) {
          return Container(
            color: _bgColorAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: Duration(seconds: 2),
                  child: Transform.translate(
                    offset: Offset(0.0, translateY),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 70, bottom: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: Duration(seconds: 2),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("Going to login page");
                          _login();
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Going to store");
                          _getDefenders();
                        },
                        child: Text("Store"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Playing game");
                          _game();
                        },
                        child: Text("Start Game"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Going to stats ");
                          _stats();
                        },
                        child: Text("Stats"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Going to settings");
                          _settings();
                        },
                        child: Text("Settings"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _getDefenders() async {
    Navigator.pushNamed(context, '/store');
  }

  Future<void> _login() async {
    Navigator.pushNamed(context, '/login');
  }

  Future<void> _settings() async {
    Navigator.pushNamed(context, '/settings');
  }

  Future<void> _stats() async {
    Navigator.pushNamed(context, '/stats');
  }

  Future<void> _game() async {
    Navigator.pushNamed(context, '/game');
  }

  @override
  void dispose() {
    _bgColorController.dispose();
    super.dispose();
  }
}
