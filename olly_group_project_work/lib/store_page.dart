import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'editedDefender.dart';
import 'store_section.dart';
import 'attack.dart';
import 'upgrade.dart';

// Olly

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.title});

  final String title;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // Create defenders
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

  List<Upgrade>? upgrades;
  List<StoreSection>? _sections;
  List<Defender>? defenders;
  StoreSection? defenderSection;
  StoreSection? upgradeSection;

  @override
  Widget build(BuildContext context) {
    defenders = [cow, sheep, chicken, farmer, cannon];
    // Create upgrades
    Upgrade cowHealthUpgrade = Upgrade(title: const Text("Cow Health +5"), value: 5, defender: cow, upgradeElement: 0);
    Upgrade cowDamageUpgrade = Upgrade(title: const Text("Cow +5 Damage"), value: 3,
                                       defender: cow, upgradeElement: 1);
    Upgrade sheepRechargeUpgrade = Upgrade(title: const Text("Sheep -5s recharge speed"), value: -5,
                                           defender: sheep, upgradeElement: 2);
    Upgrade chickenDamageUpgrade = Upgrade(title: const Text("Chicken damage +10"), value: 10,
                                           defender: chicken, upgradeElement: 3);
    Upgrade farmerRangeUpgrade = Upgrade(title: const Text("farmer attack distance +3"), value: 3,
                                         defender: farmer, upgradeElement: 4);
    Upgrade cannonRechargeUpgrade = Upgrade(title: const Text("Cannon -5s recharge speed"), value: -5,
                                            defender: cannon, upgradeElement: 5);

    upgrades = [cowHealthUpgrade, cowDamageUpgrade, sheepRechargeUpgrade, chickenDamageUpgrade,
                farmerRangeUpgrade, cannonRechargeUpgrade];

    // Create store sections
    defenderSection = StoreSection(sectionHeader: "Defenders", numberOfSquares: 5,
                                   storeItems: defenders);

    upgradeSection = StoreSection(sectionHeader: "Upgrades", numberOfSquares: 6,
                                  storeItems: upgrades);

    _sections = [defenderSection!, upgradeSection!];

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
                    // Getting items along with the amount to display
                    child: _storeSectionGrid(_sections![index].numberOfSquares!,
                        _sections![index].storeItems!)
                )
            );
          },
        ),
      ),
    );
  }
}

// Grid for the store, each grid has an amount of squares with a defender
// or upgrade
Widget _storeSectionGrid(int numberOfSquares, List<Object> storeItems){
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
            // If defender is tapped show dialog with description and
            // ability to select for the game
            // else can apply upgrade and show snackbar
            _selectDefenderOrApplyUpgrade(context, storeItems[index]);
          },
          // To resize image need a stack so I can put another
            // container on top of the grid view that's resizable, and fit an image in that
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
                  // Call a function to check type and display accordingly
                  // indexing over list of defender objects or upgrade objects
                  child: _buildItem(storeItems[index])
                  )
                ),
            ]
          )
        );
      }
  );
}

// When a defender is tapped a dialog pops up
// If selected want to apply to game board, add that object to game board
// At bottom of store have text that says choose 3 - implement later
Widget? _selectDefenderOrApplyUpgrade(BuildContext context, Object item){
  if (item is Defender){
    showDialog(context: context,
        builder: (BuildContext context){
          // Wanna return widget function
          return AlertDialog(
              title: Text(item.title!),
              content: Text(item.description()),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Select")
                )
              ],
          );
        });
  }
  if (item is Upgrade){
    item.applyUpgrade();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Upgrade applied!"),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Close',
            onPressed: (){
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        )
    );
  }
}

// If item is a Defender return the image,
// If its text return text
Widget? _buildItem(Object item){
  if (item is Defender){
    return item.skin!;
  }

  if (item is Upgrade){
    return item.title!;
  }
}