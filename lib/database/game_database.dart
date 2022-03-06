import 'package:drift/drift.dart';


class Games extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get released => text()();
  TextColumn get backgroundImage => text()();
  TextColumn get stores => text()();
  TextColumn get genres => text()();
  TextColumn get rating => text()();
  TextColumn get ratingTop => text()();
}
