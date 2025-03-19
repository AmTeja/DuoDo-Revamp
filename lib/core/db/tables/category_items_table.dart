import 'package:drift/drift.dart';

@DataClassName('CategoryItem')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(min: 1, max: 50)();
  IntColumn get icon => integer()();
  IntColumn get color => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
