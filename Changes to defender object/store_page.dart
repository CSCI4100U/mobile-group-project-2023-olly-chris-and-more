import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'store_section.dart';
import 'attack.dart';
import 'upgrade.dart';
import 'barnyard_defenders_game.dart';
import 'package:final_barnyard_defenders/actors/defender.dart';

// Olly

// Wanna pass in barnyard game class from main menu, then also pass it into game

class StorePage extends StatefulWidget {
  StorePage({Key? key, required this.title, required this.game}) : super(key: key);

  final String title;
  BarnyardDefendersGame game;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // Creating defenders
  // Might need to change paths if it wants more ie assets/...
  Defender shroom = Defender(
      storeImage: Image.asset("store_shroom.png", fit: BoxFit.contain),
      idleGameImage: "shroom_idle_(32x32).png",
      title: "Shroom",
      health: 5,
      attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
      animationFrames: 14,
      idleTextureSizeWidth: 32,
      idleTextureSizeHeight: 32
  );
  Defender snail = Defender(
      storeImage: Image.asset("store_snail.png", fit: BoxFit.contain),
      idleGameImage: "snail_idle_(38x24).png",
      title: "Snail",
      health: 5,
      attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
      animationFrames: 15,
      idleTextureSizeWidth: 38,
      idleTextureSizeHeight: 24
  );
  Defender chicken = Defender(
      storeImage: Image.asset("storechicken.png", fit: BoxFit.contain),
      idleGameImage: "chicken_idle_(32x34).png",
      title: "Chicken",
      health: 5,
      attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
      animationFrames: 13,
      idleTextureSizeWidth: 32,
      idleTextureSizeHeight: 34
  );
  Defender farmer = Defender(
      storeImage: Image.asset("store_farmer.png", fit: BoxFit.contain),
      idleGameImage: "farmer_idle_(32x32).png",
      title: "Farmer",
      health: 5,
      attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
      animationFrames: 11,
      idleTextureSizeWidth: 32,
      idleTextureSizeHeight: 32
  );
  Defender raddish = Defender(
      storeImage: Image.asset("store_raddish.png", fit: BoxFit.contain),
      idleGameImage: "raddish_idle_(30x38).png",
      title: "Raddish",
      health: 5,
      attack: Attack(damage: 5, rechargeTime: 5, distance: 5),
      animationFrames: 6,
      idleTextureSizeWidth: 30,
      idleTextureSizeHeight: 38
  );

  List<Upgrade>? upgrades;
  List<StoreSection>? _sections;
  List<Defender>? defenders;
  StoreSection? defenderSection;
  StoreSection? upgradeSection;
  List<Defender> _selectedDefenders = [];
  bool _enoughDefenders = false;
  bool _upgradeChosen = false;

  @override
  Widget build(BuildContext context) {
    defenders = [shroom, snail, chicken, farmer, raddish];
    // Create upgrades - change to match new characters
    Upgrade shroomHealthUpgrade = Upgrade(title: const Text("Shroom Health +5"), value: 5, defender: shroom, upgradeElement: 0);
    Upgrade shroomDamageUpgrade = Upgrade(title: const Text("Shroom +5 Damage"), value: 3,
                                       defender: shroom, upgradeElement: 1);
    Upgrade snailRechargeUpgrade = Upgrade(title: const Text("Snail -5s recharge speed"), value: -5,
                                           defender: snail, upgradeElement: 2);
    Upgrade chickenDamageUpgrade = Upgrade(title: const Text("Chicken damage +10"), value: 10,
                                           defender: chicken, upgradeElement: 3);
    Upgrade farmerRangeUpgrade = Upgrade(title: const Text("farmer attack distance +3"), value: 3,
                                         defender: farmer, upgradeElement: 4);
    Upgrade raddishRechargeUpgrade = Upgrade(title: const Text("Cannon -5s recharge speed"), value: -5,
                                            defender: raddish, upgradeElement: 5);

    upgrades = [shroomHealthUpgrade, shroomDamageUpgrade, snailRechargeUpgrade, chickenDamageUpgrade,
                farmerRangeUpgrade, raddishRechargeUpgrade];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 700,
            width: 450,
            color: Colors.red[300],
            child: ListView.builder(
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
          Container(
            height: 20,
            width: 450,
            child: _defendersSelectedText(),
            color: Colors.red[300],
          ),
          Container(
              height: 115,
              width: 450,
              child: _upgradeSelectedText(),
              color: Colors.red[300]
          )
        ],
      ),
    );
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
                      // Add 3 defenders from store to the game
                      if (_selectedDefenders.length < 3){
                        widget.game.defenders.add(item);
                      }
                      else{
                        // For changing textbox when user chose 3 defenders
                        setState(() {
                          _enoughDefenders = true;
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text("Select")
                )
              ],
            );
          });
    }
    // Can only apply one upgrade
    if (item is Upgrade && _upgradeChosen == false){
      // Add so it shows when can't choose any more upgrades
      setState(() {
        _upgradeChosen = true;
      });
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
      return item.storeImage!;
    }

    if (item is Upgrade){
      return item.title!;
    }
  }

  Text _defendersSelectedText(){
    if (_enoughDefenders == true){
      return Text("Max of 3 defenders chosen");
    }
    else{
      return Text("Choose 3 defenders to protect the barn!");
    }
  }

  Text _upgradeSelectedText(){
    if (_upgradeChosen == true){
      return Text("Upgrade has been selected");
    }
    else{
      return Text("Choose an upgrade to help defend the barn!");
    }
  }
}

