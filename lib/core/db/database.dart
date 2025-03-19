import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:duodo/core/db/tables/category_items_table.dart';
import 'package:duodo/core/db/tables/todo_items_table.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Todos, Categories])
class DuodoDatabase extends _$DuodoDatabase {
  DuodoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          for (var version = from + 1; version <= to; version++) {
            await m.createAll();
          }
        },
      );

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'duodo_db.sqlite'));

      final cacheBase = (await getTemporaryDirectory()).path;

      sqlite3.tempDirectory = cacheBase;

      return NativeDatabase.createInBackground(
        file,
        logStatements: kDebugMode,
      );
    });
  }
}
