import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch bacth) {
    bacth.execute('create table test (id integer)');
  }

  @override
  void update(Batch bacth) {
    bacth.execute('create table test (id integer)');
  }
}
