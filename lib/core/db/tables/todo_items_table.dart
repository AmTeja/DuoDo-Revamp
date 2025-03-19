import 'package:drift/drift.dart';
import 'package:duodo/core/db/tables/category_items_table.dart';

@TableIndex(name: 'category', columns: {#category})
@DataClassName('TodoItem')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 150)();
  TextColumn get description => text().withLength(max: 200)();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  IntColumn get category => integer().nullable().references(Categories, #id)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get reminderDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
