// ignore_for_file: avoid_print
/* 
        android:allowBackup="false"
        android:fullBackupOnly="false">

        nescessário para  android não fazer o backup automatico e bugar o bd

 */
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<Database> openConnection() async {
    /* Precisamos pegar o caminho no device aonde sera arazenado nosso banco */
    final databasePath = await getDatabasesPath();
    /* conactenamos com o nome do banco que queremos criar */
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    //print(databasePath);///data/user/0/com.example.sqlite_example/databases
    //print(databaseFinalPath);///data/user/0/com.example.sqlite_example/databases/SQLITE_EXAMPLE

    /* Abrir o banco */
    return await openDatabase(
      databaseFinalPath,
      version:
          2, // ele cria as tabelas e somente recria as tabelas qdo ele muda a versão increment ou decrement

      onConfigure: (db) async {
        print('onConfigure habilitando as foreign_keys');
        await db.execute('PRAGMA foreign_keys = ON');
      },
      /* ********************** CRIAÇÂO ********************* */
      /* Chamado somente no momento de criação do bd primeira vez que carrega o aplicativo no device */
      /* Para que um client instale o app da primeira vez e a versão ja esta fora da é preciso clonar todas as versões 
         do onUpdated e colar no create pq da primeira vez que é instalado o app ele cria e não atualiza
      */
      onCreate: (Database db, version) {
        final batch = db.batch();
        print('onCreate call $version');
        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        ''');

        batch.execute('''
          create table product(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        ''');

        /* batch.execute('''
          create table categories(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        '''); */

        batch.commit();
      }, //Ele é chamando qdo o banco de dados ainda não existir, primeira vez quando instalamos o app

      /* ********************** ATUALIZAÇÂO INCREMENTAL ********************* */
      /*  Será chamado sempre que houver uma alteração no version para (+) incremental */
      onUpgrade: (Database db, int oldVersion, int version) {
        print('onUpgrade call');
        final batch = db.batch();
        if (oldVersion == 1) {
          print('onUpgrade call $oldVersion');
          batch.execute('''
          create table product(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        ''');
          //caso tenhamos uma nova versão devemos tabem criar uma bacth dessa versão na anterior
          batch.execute('''
          create table categories(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        ''');
        }

        /* if (oldVersion == 2) {
          batch.execute('''
          create table categories(
            id Integer primary key autoincrement,
            nome varchar(200)
          )  
        ''');
        } */
        batch.commit();
      }, //Quando precisamos recriar as tabela passamos a nova versão do banco de dados

      /* ********************** ATUALIZAÇÂO DECREMENTAL ********************* */
      /*  Será chamado sempre que houver uma alteração no version para (-) decremental */
      /* Estou deletando a tabela categoria e deverei retira-la do create e onUpgrade*/
      onDowngrade: (db, oldVersion, newVersion) {
        final batch = db.batch();
        print('onDowngrade call');
        if (oldVersion == 3) {
          print('onDowngrade call $oldVersion');
          batch.execute('''
          drop table categories;
          ''');
        }
        batch.commit();
      }, //Quando precisamos retornar a versão anterios do banco de dados
    );
  }
}
