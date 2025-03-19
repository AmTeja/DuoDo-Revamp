import 'dart:async';

import 'package:drift/drift.dart';
import 'package:duodo/core/db/database.dart';
import 'package:duodo/core/domain/entities/category.dart';
import 'package:duodo/core/domain/entities/todo.dart';

class TodosHelper {
  TodosHelper(this.todosTable, this.categoriesTable);

  final $TodosTable todosTable;
  final $CategoriesTable categoriesTable;

  Future<void> insertTodo(TodosCompanion todo) async {
    await todosTable.insertOne(todo);
  }

  Stream<List<Todo>> selectTodos() {
    final query = todosTable.select().join([
      leftOuterJoin(
          categoriesTable, categoriesTable.id.equalsExp(todosTable.category)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        TodoCategory? todoCategory;
        if (row.readTableOrNull(categoriesTable.select().table) != null) {
          todoCategory = todoCategoryfromCategoryItem(
              row.readTableOrNull(categoriesTable.select().table)!);
        }
        return Todo(
          id: row.readTable(todosTable).id,
          title: row.readTable(todosTable).title,
          description: row.readTable(todosTable).description,
          category: todoCategory,
          dueDate: row.readTable(todosTable).dueDate,
          priority: row.readTable(todosTable).priority,
          reminderDate: row.readTable(todosTable).reminderDate,
          createdAt: row.readTable(todosTable).createdAt,
          updatedAt: row.readTable(todosTable).updatedAt,
          isCompleted: row.readTable(todosTable).isCompleted,
        );
      }).toList();
    });
  }

  Future<Todo?> selectTodoById(int id) async {
    final query = todosTable.select().join([
      leftOuterJoin(
          categoriesTable, categoriesTable.id.equalsExp(todosTable.category)),
    ]);

    query
      ..where(todosTable.id.equals(id))
      ..orderBy([OrderingTerm.asc(categoriesTable.id)]);

    final result = await query.getSingleOrNull();

    if (result != null) {
      TodoCategory? todoCategory;
      if (result.readTableOrNull(categoriesTable.select().table) != null) {
        todoCategory = todoCategoryfromCategoryItem(
            result.readTableOrNull(categoriesTable.select().table)!);
      }
      return Todo(
        id: result.readTable(todosTable).id,
        title: result.readTable(todosTable).title,
        description: result.readTable(todosTable).description,
        category: todoCategory,
        dueDate: result.readTable(todosTable).dueDate,
        priority: result.readTable(todosTable).priority,
        reminderDate: result.readTable(todosTable).reminderDate,
        createdAt: result.readTable(todosTable).createdAt,
        updatedAt: result.readTable(todosTable).updatedAt,
        isCompleted: result.readTable(todosTable).isCompleted,
      );
    }

    return null;
  }

  Future<void> updateTodo(TodoItem todo) async {
    (todosTable.update()..where((item) => item.id.equals(todo.id))).write(
      TodosCompanion(
        id: Value(todo.id),
        title: Value(todo.title),
        description: Value(todo.description),
        category: Value(todo.category),
        dueDate: Value(todo.dueDate),
        priority: Value(todo.priority),
        reminderDate: Value(todo.reminderDate),
        updatedAt: Value(todo.updatedAt),
        createdAt: Value(todo.createdAt),
        isCompleted: Value(todo.isCompleted),
      ),
    );
  }

  Future<void> deleteTodoById(int id) async {
    await todosTable.deleteWhere((item) => item.id.equals(id));
  }
}
