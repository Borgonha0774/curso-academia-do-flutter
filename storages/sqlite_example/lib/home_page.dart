import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlite_example/database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  Future<void> _database() async {
    final database = await DatabaseSqlite().openConnection();

    /*Podemos acessar e popular os valores no bd através do ORM do flutter */
    //database.insert('teste', {'nome': 'Rodrigo Raham'});
    //database.update('teste', {'nome': 'Academia do Flutter'},
    //    where: 'nome= ?', whereArgs: ['Rodrigo Raham']);
    //database.delete('teste', where: 'nome = ?', whereArgs: ['Rodrigo Raham']);
    /* var result = await database.query('teste');
    print(result); */

    /* vamos implementar através de querys */
    //database.rawInsert('insert into teste values(null, ?)', ['Rodrigo']);
    //database.rawUpdate('update teste set nome= ? where id = ?', ['Rodrigão', 7]);
    //database.rawDelete('delete from teste where id = ?', [7]);
    //var result = await database.rawQuery('select * from teste');
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
