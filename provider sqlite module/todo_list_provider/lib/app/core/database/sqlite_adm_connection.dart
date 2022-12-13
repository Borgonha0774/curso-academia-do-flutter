import 'package:flutter/cupertino.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

/* Precisamos controlar administrar o bd para que não seje corrompido 
    por exemplo qdo o client dai do app ou arraste para efetivar outras 
    ações no device
*/
class SqliteAdmConnection with WidgetsBindingObserver {
  /* O  WidgetsBindingObserver é um mixin que observa o flutter como um todo */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //pegamos uma instancia da conexão do bd para verificar o status
    final connection = SqliteConnectionFactory();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closedConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
