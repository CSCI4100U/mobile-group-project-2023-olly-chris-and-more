import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'store_section.dart';

// Need to add dialogs that pop up showing stats of defenders
// and dialogs showing a menu of which defender to apply upgrade to

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.title});

  final String title;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // Store has a defender and an upgrade section
  final List<StoreSection> _sections = [
    StoreSection(sectionHeader: "Defenders", numberOfSquares: 5,
        colors: [Colors.red, Colors.blue, Colors.lightBlue,
          Colors.amber, Colors.purple],
        objects: [Image.asset("assets/images/singlecow.png", fit: BoxFit.cover),
                  Image.asset("assets/images/singlechicken.png", fit: BoxFit.cover),
                  Image.asset("assets/images/singlesheep.png", fit: BoxFit.cover),
                  Image.asset("assets/images/farmer.png", fit: BoxFit.cover),
                  Image.asset("assets/images/cannon.png", fit: BoxFit.cover)]),

    StoreSection(sectionHeader: "Upgrades", numberOfSquares: 4,
        colors: [Colors.red, Colors.blue, Colors.amber, Colors.purple],
    objects: [Image.asset("assets/images/singlecow.png", fit: BoxFit.cover),
      Image.asset("assets/images/singlechicken.png", fit: BoxFit.cover),
      Image.asset("assets/images/singlesheep.png", fit: BoxFit.cover),
      Image.asset("assets/images/farmer.png", fit: BoxFit.cover)])
  ];

  @override
  Widget build(BuildContext context) {
    // Load font inside build
    final comfortaaFont = FontLoader('Comfortaa');
    comfortaaFont.addFont(rootBundle.load('assets/fonts/Comfortaa-Regular.ttf'));
    return Scaffold(
      appBar: AppBar(
        // Barns are red so red theme? Can be changed, need to add font and size to
        backgroundColor: Colors.red[400],
        title: Text(widget.title,
            style: TextStyle(fontFamily:'Comfortaa', fontSize: 40, color: Colors.white)),
      ),
      // Store body is a list of gridviews
      body: ListView.builder(
        // There are 2 sections of the shop - defenders and their upgrades - is bad code design to just have a random number?
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_sections[index].sectionHeader!, style: TextStyle(fontFamily:'Comfortaa', fontSize: 25)),
              subtitle: Container(
                  height: 250,
                  child: _storeSectionGrid(_sections[index].numberOfSquares!, _sections[index].colors!, _sections[index].objects!)
              )
          );
        },
      ),
    );
  }
}

// Use gesture detector on containers to select items and add the character
// to the game
// When you click on grid container function happens
// When you choose an upgrade dialog will pop up showing the animals
// you can then apply it to

// Makes a grid for each store section, taking number of items in a section
// and objects for the grid - right now placeholder is colors
// returns the grid for the corresponding store section
// can this even be added to store section class as a function for better design?
// Maybe make grid squares look 3d and have rounded edges?
Widget _storeSectionGrid(int numberOfSquares, List<MaterialColor> colors, List<Image> images){
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 16.0, // Spacing between columns
        // Spacing between rows
        mainAxisSpacing: 16.0,
      ),
      itemCount: numberOfSquares,
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){

          },
          // To resize image need a stack so I can put another
            // container on top of the grid view thats resizable, and fit an image in that
          child: Stack(
            children: [
              Container(
                color: colors[index]
              ),
              Center(
                child: Container(
                  color: colors[index],
                  height: 70,
                  width: 80,
                  child: images[index]
                  // child: Image.asset("assets/images/mango.png",
                  //                     fit: BoxFit.cover
                  )
                ),
            ]
          )
        );
      }
  );
}