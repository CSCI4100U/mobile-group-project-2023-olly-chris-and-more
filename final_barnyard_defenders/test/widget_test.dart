import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:olly_group_project_work/store_page.dart';
import 'package:olly_group_project_work/chris_work/pathing.dart';
import 'package:olly_group_project_work/main_menu.dart';

void main() {

  //testWidgets('Select defender dialog or apply upgrade', (widgetTester) => null);
  testWidgets('Testing dialog', (WidgetTester tester) async {
    await tester.pumpWidget(StorePage(title: 'store'));
    var dialog = find.byType(AlertDialog);
    expect(dialog, findsWidgets);
  }
  );

  testWidgets('Testing snackbar in store', (WidgetTester tester) async {
    await tester.pumpWidget(StorePage(title: 'store'));
    var snackbars = find.byType(SnackBar);
    expect(snackbars, findsWidgets);
  }
  );

  testWidgets('Finds notifications', (WidgetTester tester) async {
    await tester.pumpWidget(MovingDot());
    var notifs = find.byType(SnackBar);
    expect(notifs, findsWidgets);
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
