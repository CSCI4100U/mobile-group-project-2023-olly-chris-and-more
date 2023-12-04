import 'sqlite.dart';

// What is this
final databaseReference = FirebaseDatabase.instance.reference();

void uploadGameStats(GameStats stats) {
  databaseReference.child("stats").push().set(stats.toMap());
}