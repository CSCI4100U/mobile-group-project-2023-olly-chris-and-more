//import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olly_group_project_work/omed_work/sqlite.dart';
import 'package:olly_group_project_work/main_menu.dart';

void main(){
  test('Testing stats database', () async {
    // Setup
    GameStats stats = GameStats(gamesPlayed: 3, gamesWon: 2, highestScore: 5);
    // do function
    int result = await DatabaseHelper.insertStats(stats);
    expect(result, 1);
  }
  );

  testWidgets('Test _getDefenders function', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainMenu(title: "Barnyard Defenders")); // Replace MyApp with the root widget of your app.

    // Trigger the function
    await _getDefenders();

    // Pump the widget tree again to process the navigation
    await tester.pumpAndSettle();

    // Verify that the navigation occurred
    expect(find.text('Upgrades'), findsOneWidget);
  });



}
