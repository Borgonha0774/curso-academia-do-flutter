// ignore_for_file: constant_identifier_names

/* Fabrica de connexões precisa ser criada com conceito de singleton*/

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list_provider/app/core/database/sqlite_migration_factory.dart';

class SqliteConnectionFactory {
/* O banco de dados precisa de duas variaveis versão e nome do banco de dados */
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'TODO_LIST_PROVIDER';

/* Precisamos criar um atributo de classe que controla a database */
  Database? _db;

  /* Essa variavel vem da classe sicronized do Dart trabalha com multithreads*/
  final _lock = Lock();

/* Variavel privada que controla a instancia */
  static SqliteConnectionFactory? _instace;

/* Construtor privado  para que não possa ser instanciado de uma forma natura*/
  SqliteConnectionFactory._();

/*  Este é um construtor do tipo factory controla a instancia do sqlite implantando o padrão de singleton*/
  factory SqliteConnectionFactory() {
    // ignore: prefer_conditional_assignment
    if (_instace == null) {
      _instace = SqliteConnectionFactory._();
    }
    return _instace!;
  }

/* Open Database */
  Future<Database> openConnection() async {
    /* Pegando a rota do banco no device e inserindo o nome da banco */
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);

    /* Este processo permite abrir o banco apenas uma vez e criar a estrutura base*/
    if (_db == null) {
      await _lock.synchronized(() async {
        // ignore: prefer_conditional_assignment
        if (_db == null) {
          _db = await openDatabase(
            databasePathFinal,
            version: _VERSION,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
            onDowngrade: _onDowngrade,
          );
        }
      });
    }
    return _db!;
  }

/* Metodo de fechamento do banco de dados */
  void closedConnection() {
    _db?.close();
    _db = null;
  }

/* Configurações do bd */
//foreign_keys on para liberar as keys
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

/* Criando as listas de migrations */
  Future<void> _onCreate(Database db, int version) async {
    final bacth = db.batch();

    /* criando a primeira migration  */
    final migrations = SqliteMigrationFactory().getCreateMigration();
    for (var migration in migrations) {
      migration.create(bacth);
    }

    bacth.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final bacth = db.batch();

    /* fazendo um upgrade das tabelas alterando a version */
    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);
    for (var migration in migrations) {
      migration.update(bacth);
    }

    bacth.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
