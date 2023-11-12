import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

void uploadGameStats(GameStats stats) {
  databaseReference.child("stats").push().set(stats.toMap());
}
