import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Game Settings',
//       home: SettingsPage(),
//     );
//   }
// }

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _volume = 0.5;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.person),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          ListTile(
            title: Text('Upgrades'),
            leading: Icon(Icons.upgrade),
            onTap: () {
              // Navigate to upgrades page
            },
          ),
          ListTile(
            title: Text('Defend'),
            leading: Icon(Icons.security),
            onTap: () {
              // Navigate to defend settings page
            },
          ),
          ListTile(
            title: Text('Shop'),
            leading: Icon(Icons.shop),
            onTap: () {
              // Navigate to shop page
            },
          ),
          ListTile(
            title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            leading: Icon(Icons.settings),
            onTap: () {
              // Navigate to shop page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Volume'),
            subtitle: Slider(
              value: _volume,
              onChanged: (newVolume) {
                setState(() {
                  _volume = newVolume;
                });
              },
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(_volume * 100).round()}',
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: _notifications,
              onChanged: (newValue) {
                setState(() {
                  _notifications = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}