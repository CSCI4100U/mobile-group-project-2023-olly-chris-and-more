import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'editedDefender.dart';
import 'store_section.dart';
import 'editedCharacter.dart';
import 'attack.dart';

// Need to add dialogs that pop up showing stats of defenders
// and dialogs showing a menu of which defender to apply upgrade to

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.title});

  final String title;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Defender cow = Defender(skin: Image.asset("assets/images/singlecow.png", fit: BoxFit.scaleDown),
                          locationX: 5, locationY: 5, health: 5, title: "Cow",
                          attack: Attack(damage: 5, rechargeTime: 5, distance: 5));
  Defender sheep = Defender(skin: Image.asset("assets/images/singlesheep.png", fit: BoxFit.cover),
                            locationX: 5, locationY: 5, health: 5, title: "Sheep",
                            attack: Attack(damage: 5, rechargeTime: 5, distance: 5));
  Defender chicken = Defender(skin: Image.asset("assets/images/singlechicken.png", fit: BoxFit.cover),
                              locationX: 5, locationY: 5, health: 5, title: "Chicken",
                              attack: Attack(damage: 5, rechargeTime: 5, distance: 5));
  Defender farmer = Defender(skin: Image.asset("assets/images/farmer.png", fit: BoxFit.cover),
                             locationX: 5, locationY: 5, health: 5, title: "Farmer",
                             attack: Attack(damage: 5, rechargeTime: 5, distance: 5));
  Defender cannon = Defender(skin: Image.asset("assets/images/cannon.png", fit: BoxFit.cover),
                             locationX: 5, locationY: 5, health: 5, title: "Cannon",
                             attack: Attack(damage: 5, rechargeTime: 5, distance: 5));

  List<Widget>? defenderSkins;
  // Might just change to one color down below
  List<MaterialColor> colors1 =  [Colors.red, Colors.blue, Colors.lightBlue,Colors.amber, Colors.purple];
  List<MaterialColor> colors2 =  [Colors.red, Colors.blue, Colors.amber, Colors.purple];
  List<Text> storeUpgrades = [Text("+5 Health"), Text("-5 attack recharge time"), Text("+10 damage"),
                              Text("+3 Attack Distance")];
  List<StoreSection>? _sections;

  // List of store sections, each has a header, amount of squares,
  // colors were placeholders, now has objects which display the images
  // final List<StoreSection> _sections = [
  //   StoreSection(sectionHeader: "Defenders", numberOfSquares: 5,
  //       colors: [Colors.red, Colors.blue, Colors.lightBlue,
  //         Colors.amber, Colors.purple],
  //       // Wanna list of the defender skins and to put that here
  //       storeItems: [Defender(skin: Image.asset("assets/images/singlecow.png", fit: BoxFit.cover),
  //         locationX: 5, locationY: 5, health: 5, title: "Cow",
  //         attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
  //       ).skin!,
  //       Defender(
  //           skin: Image.asset("assets/images/singlesheep.png", fit: BoxFit.cover),
  //               locationX: 5, locationY: 5, health: 5, title: "Sheep",
  //               attack: Attack(damage: 5, rechargeTime: 5, distance: 5)
  //       ).skin!,
  //         Defender(skin: Image.asset("assets/images/singlechicken.png", fit: BoxFit.cover),
  //             locationX: 5, locationY: 5, health: 5, title: "Chicken",
  //             attack: Attack(damage: 5, rechargeTime: 5, distance: 5)).skin!,
  //         Defender(skin: Image.asset("assets/images/farmer.png", fit: BoxFit.cover),
  //             locationX: 5, locationY: 5, health: 5, title: "Farmer",
  //             attack: Attack(damage: 5, rechargeTime: 5, distance: 5)).skin!,
  //         Defender(skin: Image.asset("assets/images/cannon.png", fit: BoxFit.cover),
  //             locationX: 5, locationY: 5, health: 5, title: "Cannon",
  //             attack: Attack(damage: 5, rechargeTime: 5, distance: 5)).skin!,
  //       ]
  //   ),
  //   StoreSection(sectionHeader: "Upgrades", numberOfSquares: 4,
  //       colors: [Colors.red, Colors.blue, Colors.amber, Colors.purple],
  //   storeItems: [Text("+5 Health"), Text("-5 attack recharge time"), Text("+10 damage"),
  //   Text("+3 Attack Distance")]),
  // ];

  @override
  Widget build(BuildContext context) {
    defenderSkins = [cow.skin!, sheep.skin!, chicken.skin!, farmer.skin!, cannon.skin!];
    // Will need to add stuff for titles
    StoreSection defenders = StoreSection(sectionHeader: "Defenders", numberOfSquares: 5,
    colors: colors1, storeItems: defenderSkins);

    StoreSection upgrades = StoreSection(sectionHeader: "Upgrades", numberOfSquares: 4,
        colors: colors2, storeItems: storeUpgrades);

    _sections = [defenders, upgrades];

    // Load font inside build
    final comfortaaFont = FontLoader('Comfortaa');
    comfortaaFont.addFont(rootBundle.load('assets/fonts/Comfortaa-Regular.ttf'));
    return Scaffold(
      appBar: AppBar(
        // Barns are red so red theme? Can be changed, need to add font and size to
        backgroundColor: Colors.red[900],
        title: Text(widget.title,
            style: TextStyle(fontFamily:'Comfortaa', fontSize: 40, color: Colors.white)),
      ),
      // Store body is a list of gridviews
      body: Container(
        color: Colors.red[300],
        child: ListView.builder(
          // There are 2 sections of the shop - defenders and their upgrades - is bad code design to just have a random number?
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(_sections![index].sectionHeader!, style: TextStyle(fontFamily:'Comfortaa', fontSize: 25)),
                subtitle: Container(
                    height: 250,
                    child: _storeSectionGrid(_sections![index].numberOfSquares!,
                        _sections![index].colors!, _sections![index].storeItems!)
                )
            );
          },
        ),
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
Widget _storeSectionGrid(int numberOfSquares, List<MaterialColor> colors, List<Widget> storeItems){
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
            print("tapped");
          },
          // To resize image need a stack so I can put another
            // container on top of the grid view thats resizable, and fit an image in that
          child: Stack(
            children: [
              Container(
                color: Colors.white
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  height: 70,
                  width: 80,
                  child: storeItems[index]
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