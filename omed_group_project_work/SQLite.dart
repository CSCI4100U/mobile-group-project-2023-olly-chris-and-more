import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'game_stats.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE stats(id INTEGER PRIMARY KEY AUTOINCREMENT, gamesPlayed INTEGER, gamesWon INTEGER, highestScore INTEGER)",
        );
      },
      version: 1,
    );
  }

  static Future<int> insertStats(GameStats stats) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('stats', stats.toMap());
    return result;
  }

  // Additional functions for CRUD operations
}

class GameStats {
  final int gamesPlayed;
  final int gamesWon;
  final int highestScore;

  GameStats({this.gamesPlayed, this.gamesWon, this.highestScore});

  Map<String, dynamic> toMap() {
    return {
      'gamesPlayed': gamesPlayed,
      'gamesWon': gamesWon,
      'highestScore': highestScore,
    };
  }
}
