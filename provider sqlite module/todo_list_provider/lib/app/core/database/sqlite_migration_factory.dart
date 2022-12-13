import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v3.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        //preciso ter todas as atualizações no create caso o app não tenha sido
        //instalada no device do client todas as migrations de create
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];
  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    //vesion actual == 3
    //device do cliente está na version == 1 então ele atualiza para 2 e 3

    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }

    //device do cliente está na version == 2 então ele atualiza para  3
    if (version == 2) {
      migrations.add(MigrationV3());
    }

    return migrations;
  }
}
