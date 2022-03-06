import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'game_database.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Games])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  Stream<List<Game>> watchAllGames() => select(games).watch();
  Future insertGame(Insertable<Game> gam) => into(games).insert(gam);
  Future deleteGame(Insertable<Game> gam) => delete(games).delete(gam);

  @override
  int get schemaVersion => 1;
}
