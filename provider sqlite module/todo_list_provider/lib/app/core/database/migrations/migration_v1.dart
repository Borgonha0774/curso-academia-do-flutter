import 'package:sqflite/sqflite.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

/* Primeira migration  criando as tabelas no bd, como é a primeira version não existe update*/
class MigrationV1 implements Migration {
  @override
  void create(Batch bacth) {
    bacth.execute('''
      create table todo(
        id Integer primary key autoincrement,
        descricao varchar(500) not null,
        data_hora datetime,
        finalizado integer
      )
    ''');
  }

  @override
  void update(Batch bacth) {}
}
