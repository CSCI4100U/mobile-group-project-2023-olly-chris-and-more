import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.title});

  final String title;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final comfortaaFont = FontLoader('Comfortaa');
    comfortaaFont.addFont(rootBundle.load('assets/fonts/Comfortaa-Regular.ttf'));
    return Scaffold(
      body: Container(
        color: Colors.red[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title, style: TextStyle(
                    fontFamily:'Comfortaa',
                    fontSize: 30,
                    color: Colors.white
                  ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print("Going to login page");
                      _login();
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      // Want to return list of defenders from the store to display
                      print("Going to store");
                      _getDefenders();
                      // Want a getDefenders function to visit store and return list
                      // of defenders
                    },
                    child: Text("Store"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print("Playing game");
                    },
                    child: Text("Start Game"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print("Going to stats ");
                    },
                    child: Text("Stats"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print("Going to settings");
                    },
                    child: Text("Settings"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    )
                ),
              ],
            )
          ],
        ),
      )
    );
  }

  Future<void> _getDefenders() async{
    Navigator.pushNamed(context, '/store');
    // Stores values I receive from addGrade page
  }

  Future<void> _login() async{
    Navigator.pushNamed(context, '/login');
    // Stores values I receive from addGrade page
  }
}
