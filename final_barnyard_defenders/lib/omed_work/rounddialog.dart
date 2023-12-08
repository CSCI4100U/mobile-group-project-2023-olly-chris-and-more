import 'package:flutter/material.dart';

void showRoundDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text('Game Stats'),
        content: Text('Your game stats will be shown here.'),
        actions: <Widget>[
          // Whats FlatButton? - changed to this
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}