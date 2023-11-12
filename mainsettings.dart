import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Settings',
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool sound = true;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Sound'),
            value: sound,
            onChanged: (bool value) {
              setState(() {
                sound = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: notifications,
            onChanged: (bool value) {
              setState(() {
                notifications = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
