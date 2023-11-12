class StatsScreen extends StatelessWidget {
  final GameStats stats; // Assume this is passed to the widget

  StatsScreen({Key key, this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Stats')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Games Played: ${stats.gamesPlayed}'),
            Text('Games Won: ${stats.gamesWon}'),
            Text('Highest Score: ${stats.highestScore}'),
          ],
        ),
      ),
    );
  }
}
