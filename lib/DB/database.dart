import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'Accessors/daos.dart';
import 'Tables/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:my_journal/Models/models.dart';

part 'database.g.dart';

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });

@DriftDatabase(tables: [Users], daos: [UserDao], include: {'sql.drift'})
class AppDB extends _$AppDB {
  static AppDB? _instance;

  static AppDB getInstance() {
    _instance ??= AppDB();
    return _instance!;
  }

  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      beforeOpen: (openingDetails) async {
        final m = createMigrator();
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      },
      onCreate: (m) async => m.createAll(),
      onUpgrade: (m, from, to) async {
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      });
}
