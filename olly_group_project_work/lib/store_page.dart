import 'package:flutter/material.dart';
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
    StoreSection(sectionHeader: "Defenders", gridItems: 5,
        colors: [Colors.red, Colors.blue, Colors.lightBlue,
          Colors.amber, Colors.purple]),
    StoreSection(sectionHeader: "Upgrades", gridItems: 4,
        colors: [Colors.red, Colors.blue, Colors.amber, Colors.purple])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barns are red so red theme? Can be changed, need to add font and size to
        backgroundColor: Colors.red[400],
        title: Text(widget.title),
      ),
      // Store body is a list of gridviews
      body: ListView.builder(
        // There are 2 sections of the shop - defenders and their upgrades - is bad code design to just have a random number?
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_sections[index].sectionHeader!),
              subtitle: Container(
                  height: 250,
                  child: _storeSectionGrid(_sections[index].gridItems!, _sections[index].colors!)
              )
          );
        },
      ),
    );
  }
}

// Makes a grid for each store section, taking number of items in a section
// and objects for the grid - right now placeholder is colors
// returns the grid for the corresponding store section
// can this even be added to store section class as a function for better design?
// Maybe make grid squares look 3d and have rounded edges?
Widget _storeSectionGrid(int gridItems, List<MaterialColor> colors){
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 16.0, // Spacing between columns
        // Spacing between rows
        mainAxisSpacing: 16.0,
      ),
      itemCount: gridItems,
      itemBuilder: (BuildContext context, int index){
        return Container(
          // Here each container will have a different picture + text
          // Which is stored in a list
            color: colors[index]
        );
      }
  );
}