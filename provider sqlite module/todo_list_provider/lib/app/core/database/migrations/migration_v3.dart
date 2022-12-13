import 'package:sqflite/sqflite.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch bacth) {
    bacth.execute('create table products (id integer)');
  }

  @override
  void update(Batch bacth) {
    bacth.execute('create table products (id integer)');
  }
}
